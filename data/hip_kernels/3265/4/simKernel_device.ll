; ModuleID = '../data/hip_kernels/3265/4/main.cu'
source_filename = "../data/hip_kernels/3265/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9simKerneliiPfS_S_PiS0_S0_S_S_S0_f(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture %6, i32 addrspace(1)* nocapture %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture writeonly %9, i32 addrspace(1)* nocapture %10, float %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %21, %0
  br i1 %22, label %23, label %94

23:                                               ; preds = %12
  %24 = mul nsw i32 %21, %1
  %25 = sext i32 %21 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = add nsw i32 %27, %24
  %29 = add nsw i32 %24, %1
  %30 = icmp slt i32 %27, %1
  br i1 %30, label %31, label %91

31:                                               ; preds = %23
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %25
  %33 = getelementptr inbounds float, float addrspace(1)* %9, i64 %25
  %34 = getelementptr inbounds float, float addrspace(1)* %8, i64 %25
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %25
  br label %36

36:                                               ; preds = %31, %87
  %37 = phi i32 [ %28, %31 ], [ %89, %87 ]
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !11
  %41 = srem i32 %37, %1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %3, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !11
  %45 = fmul contract float %40, %44
  %46 = getelementptr inbounds float, float addrspace(1)* %4, i64 %42
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !11
  %48 = fadd contract float %47, %11
  %49 = fcmp contract ogt float %45, %48
  %50 = fneg contract float %47
  %51 = fsub contract float %50, %11
  %52 = fcmp contract olt float %45, %51
  %53 = select i1 %49, i1 true, i1 %52
  br i1 %53, label %54, label %87

54:                                               ; preds = %36
  br i1 %49, label %55, label %66

55:                                               ; preds = %54
  %56 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %57 = icmp slt i32 %56, 1
  br i1 %57, label %58, label %66

58:                                               ; preds = %55
  %59 = fadd contract float %44, %47
  %60 = fadd contract float %59, %11
  store float %60, float addrspace(1)* %33, align 4, !tbaa !11
  %61 = sub nsw i32 1, %56
  %62 = sitofp i32 %61 to float
  %63 = fmul contract float %60, %62
  %64 = load float, float addrspace(1)* %34, align 4, !tbaa !11
  %65 = fsub contract float %64, %63
  br label %78

66:                                               ; preds = %55, %54
  br i1 %52, label %67, label %87

67:                                               ; preds = %66
  %68 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %69 = icmp sgt i32 %68, -1
  br i1 %69, label %70, label %87

70:                                               ; preds = %67
  %71 = fsub contract float %44, %47
  %72 = fsub contract float %71, %11
  store float %72, float addrspace(1)* %33, align 4, !tbaa !11
  %73 = add nuw nsw i32 %68, 1
  %74 = sitofp i32 %73 to float
  %75 = fmul contract float %72, %74
  %76 = load float, float addrspace(1)* %34, align 4, !tbaa !11
  %77 = fadd contract float %75, %76
  br label %78

78:                                               ; preds = %58, %70
  %79 = phi float [ %77, %70 ], [ %65, %58 ]
  %80 = phi i32 [ %73, %70 ], [ %61, %58 ]
  %81 = phi i32 [ -1, %70 ], [ 1, %58 ]
  store float %79, float addrspace(1)* %34, align 4, !tbaa !11
  %82 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %83 = add nsw i32 %82, %80
  store i32 %83, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %81, i32 addrspace(1)* %32, align 4, !tbaa !7
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %42
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7
  %86 = add nsw i32 %85, %37
  br label %87

87:                                               ; preds = %78, %36, %66, %67
  %88 = phi i32 [ %37, %67 ], [ %37, %66 ], [ %37, %36 ], [ %86, %78 ]
  %89 = add nsw i32 %88, 1
  %90 = icmp slt i32 %89, %29
  br i1 %90, label %36, label %91, !llvm.loop !13

91:                                               ; preds = %87, %23
  %92 = phi i32 [ %28, %23 ], [ %89, %87 ]
  %93 = sub nsw i32 %92, %29
  store i32 %93, i32 addrspace(1)* %26, align 4, !tbaa !7
  br label %94

94:                                               ; preds = %12, %91
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
