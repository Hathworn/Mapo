; ModuleID = '../data/hip_kernels/3761/51/main.cu'
source_filename = "../data/hip_kernels/3761/51/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9GetSpikesPdiiiPfiiS0_ii(double addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = add i32 %18, %11
  %20 = mul nsw i32 %2, %1
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %48

22:                                               ; preds = %10
  %23 = freeze i32 %19
  %24 = freeze i32 %1
  %25 = sdiv i32 %23, %24
  %26 = mul i32 %25, %24
  %27 = sub i32 %23, %26
  %28 = mul nsw i32 %27, %8
  %29 = mul nsw i32 %25, %9
  %30 = add nsw i32 %29, %28
  %31 = mul nsw i32 %27, %5
  %32 = mul nsw i32 %25, %6
  %33 = add nsw i32 %32, %31
  %34 = sext i32 %30 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %7, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = fpext float %36 to double
  %38 = sext i32 %19 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !11, !amdgpu.noclobber !6
  %41 = sext i32 %33 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %4, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = fpext float %43 to double
  %45 = fmul contract double %40, %44
  %46 = fadd contract double %45, %37
  %47 = fptrunc double %46 to float
  store float %47, float addrspace(1)* %35, align 4, !tbaa !7
  br label %48

48:                                               ; preds = %22, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
