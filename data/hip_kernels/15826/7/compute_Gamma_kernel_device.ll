; ModuleID = '../data/hip_kernels/15826/7/main.cu'
source_filename = "../data/hip_kernels/15826/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20compute_Gamma_kernelPdiiS_iiiS_iiiPiS_S_(double addrspace(1)* nocapture %0, i32 %1, i32 %2, double addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, double addrspace(1)* nocapture readonly %7, i32 %8, i32 %9, i32 %10, i32 addrspace(1)* nocapture readonly %11, double addrspace(1)* nocapture readonly %12, double addrspace(1)* nocapture readonly %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %15, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr i8, i8 addrspace(4)* %16, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = mul i32 %24, %28
  %30 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %31 = add i32 %29, %30
  %32 = sub nsw i32 %5, %9
  %33 = icmp slt i32 %23, %1
  %34 = icmp slt i32 %31, %1
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %36, label %71

36:                                               ; preds = %14
  %37 = sext i32 %23 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = sext i32 %31 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = icmp slt i32 %42, %32
  br i1 %43, label %44, label %58

44:                                               ; preds = %36
  %45 = icmp eq i32 %39, %42
  %46 = select i1 %45, double 1.000000e+00, double 0.000000e+00
  %47 = mul nsw i32 %42, %6
  %48 = add nsw i32 %47, %39
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds double, double addrspace(1)* %3, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !11, !amdgpu.noclobber !5
  %52 = getelementptr inbounds double, double addrspace(1)* %12, i64 %40
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !11, !amdgpu.noclobber !5
  %54 = fmul contract double %51, %53
  %55 = fsub contract double %54, %46
  %56 = fadd contract double %53, -1.000000e+00
  %57 = fdiv contract double %55, %56
  br label %65

58:                                               ; preds = %36
  %59 = sub nsw i32 %42, %32
  %60 = mul nsw i32 %59, %10
  %61 = add nsw i32 %60, %39
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %7, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !11, !amdgpu.noclobber !5
  br label %65

65:                                               ; preds = %58, %44
  %66 = phi double [ %57, %44 ], [ %64, %58 ]
  %67 = mul nsw i32 %31, %2
  %68 = add nsw i32 %67, %23
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %0, i64 %69
  store double %66, double addrspace(1)* %70, align 8, !tbaa !11
  br label %71

71:                                               ; preds = %65, %14
  %72 = icmp eq i32 %23, %31
  %73 = select i1 %35, i1 %72, i1 false
  br i1 %73, label %74, label %86

74:                                               ; preds = %71
  %75 = sext i32 %23 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %13, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !11
  %78 = fadd contract double %77, -1.000000e+00
  %79 = fdiv contract double %77, %78
  %80 = mul nsw i32 %23, %2
  %81 = add nsw i32 %80, %23
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %0, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !11
  %85 = fsub contract double %84, %79
  store double %85, double addrspace(1)* %83, align 8, !tbaa !11
  br label %86

86:                                               ; preds = %74, %71
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
