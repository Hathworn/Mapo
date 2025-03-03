; ModuleID = '../data/hip_kernels/14764/1/main.cu'
source_filename = "../data/hip_kernels/14764/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25process_coarseness_ak_pixPdS_iil(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i64 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp slt i32 %14, %2
  %24 = icmp slt i32 %22, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %85

26:                                               ; preds = %5
  %27 = mul nsw i32 %14, %3
  %28 = add nsw i32 %27, %22
  %29 = sext i32 %22 to i64
  %30 = sext i32 %14 to i64
  %31 = sdiv i64 %4, 2
  %32 = sext i32 %3 to i64
  %33 = sext i32 %2 to i64
  %34 = sub nsw i64 %30, %31
  %35 = sub nsw i64 %29, %31
  %36 = add nsw i64 %31, %30
  %37 = tail call i64 @llvm.smax.i64(i64 %35, i64 0)
  %38 = tail call i64 @llvm.smin.i64(i64 %36, i64 %33)
  %39 = add nsw i64 %38, -1
  %40 = icmp slt i64 %35, 1
  br i1 %40, label %47, label %41

41:                                               ; preds = %26
  %42 = mul nsw i64 %39, %32
  %43 = add nsw i64 %37, -1
  %44 = add i64 %43, %42
  %45 = getelementptr inbounds double, double addrspace(1)* %1, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7, !amdgpu.noclobber !6
  br label %47

47:                                               ; preds = %41, %26
  %48 = phi double [ %46, %41 ], [ 0.000000e+00, %26 ]
  %49 = icmp slt i64 %34, 1
  br i1 %49, label %56, label %50

50:                                               ; preds = %47
  %51 = add nsw i64 %38, -2
  %52 = mul nsw i64 %51, %32
  %53 = add nsw i64 %52, %37
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7, !amdgpu.noclobber !6
  br label %56

56:                                               ; preds = %50, %47
  %57 = phi i1 [ true, %47 ], [ %40, %50 ]
  %58 = phi double [ 0.000000e+00, %47 ], [ %55, %50 ]
  br i1 %57, label %66, label %59

59:                                               ; preds = %56
  %60 = add nsw i64 %38, -2
  %61 = mul nsw i64 %60, %32
  %62 = add nsw i64 %37, -1
  %63 = add i64 %62, %61
  %64 = getelementptr inbounds double, double addrspace(1)* %1, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7, !amdgpu.noclobber !6
  br label %66

66:                                               ; preds = %56, %59
  %67 = phi double [ %65, %59 ], [ 0.000000e+00, %56 ]
  %68 = add nsw i64 %31, %29
  %69 = tail call i64 @llvm.smin.i64(i64 %68, i64 %32)
  %70 = tail call i64 @llvm.smax.i64(i64 %34, i64 0)
  %71 = mul nsw i64 %39, %32
  %72 = add nsw i64 %71, %37
  %73 = getelementptr inbounds double, double addrspace(1)* %1, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !7, !amdgpu.noclobber !6
  %75 = sub i64 %38, %70
  %76 = sub i64 %69, %37
  %77 = mul nsw i64 %76, %75
  %78 = fsub contract double %74, %48
  %79 = fsub contract double %78, %58
  %80 = fadd contract double %67, %79
  %81 = sitofp i64 %77 to double
  %82 = fdiv contract double %80, %81
  %83 = sext i32 %28 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %0, i64 %83
  store double %82, double addrspace(1)* %84, align 8, !tbaa !7
  br label %85

85:                                               ; preds = %66, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.smax.i64(i64, i64) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.smin.i64(i64, i64) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
