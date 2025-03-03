; ModuleID = '../data/hip_kernels/16640/1/main.cu'
source_filename = "../data/hip_kernels/16640/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22matrix_multiply_kernelPdS_S_l(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = zext i32 %13 to i64
  %15 = icmp slt i64 %14, %3
  br i1 %15, label %16, label %116

16:                                               ; preds = %4
  %17 = icmp sgt i64 %3, 0
  br i1 %17, label %18, label %113

18:                                               ; preds = %16
  %19 = mul nsw i64 %14, %3
  %20 = and i64 %3, 7
  %21 = icmp ult i64 %3, 8
  br i1 %21, label %94, label %22

22:                                               ; preds = %18
  %23 = and i64 %3, -8
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i64 [ 0, %22 ], [ %91, %24 ]
  %26 = phi double [ 0.000000e+00, %22 ], [ %90, %24 ]
  %27 = phi i64 [ 0, %22 ], [ %92, %24 ]
  %28 = add nsw i64 %25, %19
  %29 = getelementptr inbounds double, double addrspace(1)* %0, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !7, !amdgpu.noclobber !6
  %31 = getelementptr inbounds double, double addrspace(1)* %1, i64 %25
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !7, !amdgpu.noclobber !6
  %33 = fmul contract double %30, %32
  %34 = fadd contract double %26, %33
  %35 = or i64 %25, 1
  %36 = add nsw i64 %35, %19
  %37 = getelementptr inbounds double, double addrspace(1)* %0, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7, !amdgpu.noclobber !6
  %39 = getelementptr inbounds double, double addrspace(1)* %1, i64 %35
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7, !amdgpu.noclobber !6
  %41 = fmul contract double %38, %40
  %42 = fadd contract double %34, %41
  %43 = or i64 %25, 2
  %44 = add nsw i64 %43, %19
  %45 = getelementptr inbounds double, double addrspace(1)* %0, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7, !amdgpu.noclobber !6
  %47 = getelementptr inbounds double, double addrspace(1)* %1, i64 %43
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7, !amdgpu.noclobber !6
  %49 = fmul contract double %46, %48
  %50 = fadd contract double %42, %49
  %51 = or i64 %25, 3
  %52 = add nsw i64 %51, %19
  %53 = getelementptr inbounds double, double addrspace(1)* %0, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !7, !amdgpu.noclobber !6
  %55 = getelementptr inbounds double, double addrspace(1)* %1, i64 %51
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !7, !amdgpu.noclobber !6
  %57 = fmul contract double %54, %56
  %58 = fadd contract double %50, %57
  %59 = or i64 %25, 4
  %60 = add nsw i64 %59, %19
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !7, !amdgpu.noclobber !6
  %63 = getelementptr inbounds double, double addrspace(1)* %1, i64 %59
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !6
  %65 = fmul contract double %62, %64
  %66 = fadd contract double %58, %65
  %67 = or i64 %25, 5
  %68 = add nsw i64 %67, %19
  %69 = getelementptr inbounds double, double addrspace(1)* %0, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7, !amdgpu.noclobber !6
  %71 = getelementptr inbounds double, double addrspace(1)* %1, i64 %67
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7, !amdgpu.noclobber !6
  %73 = fmul contract double %70, %72
  %74 = fadd contract double %66, %73
  %75 = or i64 %25, 6
  %76 = add nsw i64 %75, %19
  %77 = getelementptr inbounds double, double addrspace(1)* %0, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !7, !amdgpu.noclobber !6
  %79 = getelementptr inbounds double, double addrspace(1)* %1, i64 %75
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !7, !amdgpu.noclobber !6
  %81 = fmul contract double %78, %80
  %82 = fadd contract double %74, %81
  %83 = or i64 %25, 7
  %84 = add nsw i64 %83, %19
  %85 = getelementptr inbounds double, double addrspace(1)* %0, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7, !amdgpu.noclobber !6
  %87 = getelementptr inbounds double, double addrspace(1)* %1, i64 %83
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7, !amdgpu.noclobber !6
  %89 = fmul contract double %86, %88
  %90 = fadd contract double %82, %89
  %91 = add nuw nsw i64 %25, 8
  %92 = add nuw i64 %27, 8
  %93 = icmp eq i64 %92, %23
  br i1 %93, label %94, label %24, !llvm.loop !11

94:                                               ; preds = %24, %18
  %95 = phi double [ undef, %18 ], [ %90, %24 ]
  %96 = phi i64 [ 0, %18 ], [ %91, %24 ]
  %97 = phi double [ 0.000000e+00, %18 ], [ %90, %24 ]
  %98 = icmp eq i64 %20, 0
  br i1 %98, label %113, label %99

99:                                               ; preds = %94, %99
  %100 = phi i64 [ %110, %99 ], [ %96, %94 ]
  %101 = phi double [ %109, %99 ], [ %97, %94 ]
  %102 = phi i64 [ %111, %99 ], [ 0, %94 ]
  %103 = add nsw i64 %100, %19
  %104 = getelementptr inbounds double, double addrspace(1)* %0, i64 %103
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7, !amdgpu.noclobber !6
  %106 = getelementptr inbounds double, double addrspace(1)* %1, i64 %100
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !7, !amdgpu.noclobber !6
  %108 = fmul contract double %105, %107
  %109 = fadd contract double %101, %108
  %110 = add nuw nsw i64 %100, 1
  %111 = add i64 %102, 1
  %112 = icmp eq i64 %111, %20
  br i1 %112, label %113, label %99, !llvm.loop !13

113:                                              ; preds = %94, %99, %16
  %114 = phi double [ 0.000000e+00, %16 ], [ %95, %94 ], [ %109, %99 ]
  %115 = getelementptr inbounds double, double addrspace(1)* %2, i64 %14
  store double %114, double addrspace(1)* %115, align 8, !tbaa !7
  br label %116

116:                                              ; preds = %113, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
