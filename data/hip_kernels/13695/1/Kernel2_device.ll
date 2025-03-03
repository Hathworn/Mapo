; ModuleID = '../data/hip_kernels/13695/1/main.cu'
source_filename = "../data/hip_kernels/13695/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7Kernel2PfiiE4k_k1 = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ7Kernel2PfiiE4k1_k = internal unnamed_addr addrspace(3) global float undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z7Kernel2Pfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp eq i32 %8, 0
  %18 = icmp eq i32 %15, 0
  %19 = select i1 %17, i1 %18, i1 false
  %20 = mul nsw i32 %2, %1
  %21 = add nsw i32 %2, 1
  br i1 %19, label %24, label %22

22:                                               ; preds = %3
  %23 = mul nsw i32 %21, %1
  br label %34

24:                                               ; preds = %3
  %25 = add nsw i32 %20, %21
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %28, float addrspace(3)* @_ZZ7Kernel2PfiiE4k_k1, align 4, !tbaa !7
  %29 = mul nsw i32 %21, %1
  %30 = add nsw i32 %29, %2
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %33, float addrspace(3)* @_ZZ7Kernel2PfiiE4k1_k, align 4, !tbaa !7
  br label %34

34:                                               ; preds = %22, %24
  %35 = phi i32 [ %23, %22 ], [ %29, %24 ]
  %36 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %37 = zext i16 %7 to i32
  %38 = mul i32 %36, %37
  %39 = add i32 %38, %8
  %40 = mul nsw i32 %39, %1
  %41 = add nsw i32 %40, %16
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = add nsw i32 %16, %20
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = add nsw i32 %40, %2
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fadd contract float %48, %52
  %54 = fcmp contract ogt float %44, %53
  %55 = select i1 %54, float %53, float %44
  %56 = add nsw i32 %40, %21
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = add nsw i32 %16, %35
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = load float, float addrspace(3)* @_ZZ7Kernel2PfiiE4k_k1, align 4, !tbaa !7
  %65 = fadd contract float %52, %64
  %66 = fcmp contract ogt float %59, %65
  %67 = select i1 %66, float %65, float %59
  %68 = load float, float addrspace(3)* @_ZZ7Kernel2PfiiE4k1_k, align 4, !tbaa !7
  %69 = fadd contract float %48, %68
  %70 = fcmp contract ogt float %63, %69
  %71 = select i1 %70, float %69, float %63
  %72 = fadd contract float %67, %71
  %73 = fcmp contract ogt float %55, %72
  %74 = select i1 %73, float %72, float %55
  store float %74, float addrspace(1)* %43, align 4, !tbaa !7
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
