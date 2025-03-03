; ModuleID = '../data/hip_kernels/7811/33/main.cu'
source_filename = "../data/hip_kernels/7811/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17ChannelBoxKernelBPKfPfiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %2
  %24 = icmp slt i32 %22, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %82

26:                                               ; preds = %5
  %27 = mul nsw i32 %22, %2
  %28 = add nsw i32 %27, %14
  %29 = shl nsw i32 %28, 2
  %30 = icmp eq i32 %4, 1
  br i1 %30, label %31, label %43

31:                                               ; preds = %26
  %32 = add nuw nsw i32 %29, 3
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %36 = sext i32 %29 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  store float %35, float addrspace(1)* %37, align 4, !tbaa !7
  %38 = add nuw nsw i32 %29, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  store float %35, float addrspace(1)* %40, align 4, !tbaa !7
  %41 = add nuw nsw i32 %29, 2
  %42 = sext i32 %41 to i64
  br label %76

43:                                               ; preds = %26
  %44 = sext i32 %29 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = add nuw nsw i32 %29, 3
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = add nuw nsw i32 %29, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %56 = add nuw nsw i32 %29, 2
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = bitcast float addrspace(1)* %58 to <2 x float> addrspace(1)*
  %60 = load <2 x float>, <2 x float> addrspace(1)* %59, align 4, !tbaa !7
  %61 = extractelement <2 x float> %60, i64 1
  %62 = fmul contract float %46, %61
  %63 = fsub contract float 1.000000e+00, %61
  %64 = fmul contract float %50, %63
  %65 = fadd contract float %62, %64
  store float %65, float addrspace(1)* %45, align 4, !tbaa !7
  %66 = fmul contract float %54, %61
  %67 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %68 = fmul contract float %67, %63
  %69 = fadd contract float %66, %68
  store float %69, float addrspace(1)* %53, align 4, !tbaa !7
  %70 = extractelement <2 x float> %60, i64 0
  %71 = fmul contract float %70, %61
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = fmul contract float %73, %63
  %75 = fadd contract float %71, %74
  br label %76

76:                                               ; preds = %43, %31
  %77 = phi i64 [ %48, %43 ], [ %33, %31 ]
  %78 = phi i64 [ %57, %43 ], [ %42, %31 ]
  %79 = phi contract float [ %75, %43 ], [ %35, %31 ]
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  store float %79, float addrspace(1)* %80, align 4, !tbaa !7
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  store float 1.000000e+00, float addrspace(1)* %81, align 4, !tbaa !7
  br label %82

82:                                               ; preds = %76, %5
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
