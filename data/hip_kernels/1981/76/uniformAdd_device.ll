; ModuleID = '../data/hip_kernels/1981/76/main.cu'
source_filename = "../data/hip_kernels/1981/76/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10uniformAddPiS_iiiE3uni = internal unnamed_addr addrspace(3) global float undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z10uniformAddPiS_iii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp eq i32 %6, 0
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  br i1 %7, label %9, label %15

9:                                                ; preds = %5
  %10 = add i32 %8, %3
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %11
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = sitofp i32 %13 to float
  store float %14, float addrspace(3)* @_ZZ10uniformAddPiS_iiiE3uni, align 4, !tbaa !10
  br label %15

15:                                               ; preds = %5, %9
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !12, !invariant.load !9
  %20 = zext i16 %19 to i32
  %21 = shl i32 %8, 8
  %22 = ashr exact i32 %21, 7
  %23 = mul i32 %22, %20
  %24 = add i32 %6, %4
  %25 = add i32 %24, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = load float, float addrspace(3)* @_ZZ10uniformAddPiS_iiiE3uni, align 4, !tbaa !10
  %27 = zext i32 %25 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = sitofp i32 %29 to float
  %31 = fadd contract float %26, %30
  %32 = fptosi float %31 to i32
  store i32 %32, i32 addrspace(1)* %28, align 4, !tbaa !5
  %33 = add nuw nsw i32 %6, %20
  %34 = icmp ult i32 %33, %2
  %35 = uitofp i1 %34 to float
  %36 = fmul contract float %26, %35
  %37 = add i32 %25, %20
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !5
  %41 = sitofp i32 %40 to float
  %42 = fadd contract float %36, %41
  %43 = fptosi float %42 to i32
  store i32 %43, i32 addrspace(1)* %39, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = !{i16 1, i16 1025}
