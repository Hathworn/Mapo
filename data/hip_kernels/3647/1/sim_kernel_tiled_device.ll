; ModuleID = '../data/hip_kernels/3647/1/main.cu'
source_filename = "../data/hip_kernels/3647/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@z_tile = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z16sim_kernel_tiledPdS_mmddd(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture %1, i64 %2, i64 %3, double %4, double %5, double %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = freeze i16 %12
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = freeze i16 %19
  %21 = zext i16 %20 to i32
  %22 = mul i32 %16, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add nuw nsw i32 %23, 1
  %25 = add i32 %24, %15
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %27 = add nuw nsw i32 %26, 1
  %28 = add i32 %27, %22
  %29 = sext i32 %28 to i64
  %30 = mul i64 %29, %2
  %31 = sext i32 %25 to i64
  %32 = add i64 %30, %31
  %33 = getelementptr inbounds double, double addrspace(1)* %0, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !7, !amdgpu.noclobber !5
  %35 = mul nuw nsw i32 %26, %14
  %36 = add nuw nsw i32 %35, %23
  %37 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @z_tile, i32 0, i32 %36
  store double %34, double addrspace(3)* %37, align 8, !tbaa !7
  %38 = add i64 %2, -1
  %39 = icmp ugt i64 %38, %31
  %40 = add i64 %3, -1
  %41 = icmp ugt i64 %40, %29
  %42 = select i1 %39, i1 %41, i1 false
  br i1 %42, label %43, label %109

43:                                               ; preds = %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = add nsw i32 %14, -2
  %45 = add nsw i32 %23, -1
  %46 = icmp ult i32 %45, %44
  br i1 %46, label %47, label %51

47:                                               ; preds = %43
  %48 = add nsw i32 %36, -1
  %49 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @z_tile, i32 0, i32 %48
  %50 = load double, double addrspace(3)* %49, align 8, !tbaa !7
  br label %60

51:                                               ; preds = %43
  %52 = icmp eq i32 %23, 0
  %53 = select i1 %52, i32 1, i32 -1
  %54 = select i1 %52, i32 -1, i32 1
  %55 = add nsw i32 %25, %54
  %56 = sext i32 %55 to i64
  %57 = add i64 %30, %56
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7, !amdgpu.noclobber !5
  br label %60

60:                                               ; preds = %51, %47
  %61 = phi i32 [ %53, %51 ], [ 1, %47 ]
  %62 = phi double [ %59, %51 ], [ %50, %47 ]
  %63 = add nsw i32 %36, %61
  %64 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @z_tile, i32 0, i32 %63
  %65 = load double, double addrspace(3)* %64, align 8, !tbaa !7
  %66 = fadd contract double %62, %65
  %67 = fmul contract double %34, 2.000000e+00
  %68 = fsub contract double %66, %67
  %69 = fmul contract double %68, %4
  %70 = add nsw i32 %21, -2
  %71 = add nsw i32 %26, -1
  %72 = icmp ult i32 %71, %70
  br i1 %72, label %73, label %78

73:                                               ; preds = %60
  %74 = mul nuw nsw i32 %71, %14
  %75 = add nuw nsw i32 %74, %23
  %76 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @z_tile, i32 0, i32 %75
  %77 = load double, double addrspace(3)* %76, align 8, !tbaa !7
  br label %88

78:                                               ; preds = %60
  %79 = icmp eq i32 %26, 0
  %80 = select i1 %79, i32 -1, i32 1
  %81 = add nsw i32 %28, %80
  %82 = sext i32 %81 to i64
  %83 = mul i64 %82, %2
  %84 = add i64 %83, %31
  %85 = getelementptr inbounds double, double addrspace(1)* %0, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7, !amdgpu.noclobber !5
  %87 = sub nsw i32 %26, %80
  br label %88

88:                                               ; preds = %78, %73
  %89 = phi i32 [ %87, %78 ], [ %27, %73 ]
  %90 = phi double [ %86, %78 ], [ %77, %73 ]
  %91 = phi double [ %4, %78 ], [ %5, %73 ]
  %92 = mul nsw i32 %89, %14
  %93 = add nsw i32 %92, %23
  %94 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @z_tile, i32 0, i32 %93
  %95 = load double, double addrspace(3)* %94, align 8, !tbaa !7
  %96 = fadd contract double %90, %95
  %97 = fmul contract double %34, 2.000000e+00
  %98 = fsub contract double %96, %97
  %99 = fmul contract double %98, %91
  %100 = fadd contract double %69, %99
  %101 = fmul contract double %100, 5.000000e-01
  %102 = fmul contract double %101, %6
  %103 = getelementptr inbounds double, double addrspace(1)* %1, i64 %32
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !7, !amdgpu.noclobber !5
  %105 = fadd contract double %104, %102
  store double %105, double addrspace(1)* %103, align 8, !tbaa !7
  %106 = fmul contract double %105, %6
  %107 = load double, double addrspace(1)* %33, align 8, !tbaa !7
  %108 = fadd contract double %107, %106
  store double %108, double addrspace(1)* %33, align 8, !tbaa !7
  br label %109

109:                                              ; preds = %7, %88
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
