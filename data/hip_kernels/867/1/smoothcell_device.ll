; ModuleID = '../data/hip_kernels/867/1/main.cu'
source_filename = "../data/hip_kernels/867/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z10smoothcellPfS_(float addrspace(1)* readonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = mul i32 %4, 70
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds float, float addrspace(1)* %0, i64 %6
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = mul i32 %8, 10
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %7, i64 %10
  %12 = icmp eq float addrspace(1)* %0, addrspacecast (float* null to float addrspace(1)*)
  br i1 %12, label %34, label %13

13:                                               ; preds = %2
  %14 = trunc i32 %3 to i16
  %15 = add nuw nsw i16 %14, 1
  %16 = urem i16 %15, 10
  %17 = add nuw nsw i16 %14, 9
  %18 = urem i16 %17, 10
  %19 = zext i32 %3 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %11, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = fmul contract float %21, 0x3FE99999A0000000
  %23 = zext i16 %18 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %11, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  %26 = fmul contract float %25, 0x3FB99999A0000000
  %27 = fadd contract float %22, %26
  %28 = zext i16 %16 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %11, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !5, !amdgpu.noclobber !9
  %31 = fmul contract float %30, 0x3FB99999A0000000
  %32 = fadd contract float %27, %31
  %33 = insertelement <10 x float> undef, float %32, i32 %3
  br label %34

34:                                               ; preds = %13, %2
  %35 = phi <10 x float> [ undef, %2 ], [ %33, %13 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = extractelement <10 x float> %35, i32 %3
  %37 = add i32 %9, %3
  %38 = add i32 %37, %5
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  store float %36, float addrspace(1)* %40, align 4, !tbaa !5
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
