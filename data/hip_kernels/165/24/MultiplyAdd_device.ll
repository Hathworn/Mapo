; ModuleID = '../data/hip_kernels/165/24/main.cu'
source_filename = "../data/hip_kernels/165/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_ConstantA = protected addrspace(4) externally_initialized global [8 x float] zeroinitializer, align 16
@d_ConstantB = protected addrspace(4) externally_initialized global [8 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([8 x float] addrspace(4)* @d_ConstantA to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast ([8 x float] addrspace(4)* @d_ConstantB to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z11MultiplyAddPfS_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 8
  %7 = ashr exact i32 %6, 4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add nsw i32 %7, %8
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 8
  %12 = ashr exact i32 %11, 4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = add nsw i32 %12, %13
  %15 = icmp slt i32 %9, %2
  %16 = icmp slt i32 %14, %3
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %33

18:                                               ; preds = %4
  %19 = shl i32 %2, 8
  %20 = ashr exact i32 %19, 8
  %21 = shl i32 %14, 8
  %22 = ashr exact i32 %21, 8
  %23 = mul nsw i32 %20, %22
  %24 = add nsw i32 %23, %9
  %25 = load float, float addrspace(4)* getelementptr inbounds ([8 x float], [8 x float] addrspace(4)* @d_ConstantA, i64 0, i64 0), align 16, !tbaa !5
  %26 = sext i32 %24 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = fmul contract float %25, %28
  %30 = load float, float addrspace(4)* getelementptr inbounds ([8 x float], [8 x float] addrspace(4)* @d_ConstantB, i64 0, i64 0), align 16, !tbaa !5
  %31 = fadd contract float %29, %30
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  store float %31, float addrspace(1)* %32, align 4, !tbaa !5
  br label %33

33:                                               ; preds = %18, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
