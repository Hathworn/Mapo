; ModuleID = '../data/hip_kernels/1499/3/main.cu'
source_filename = "../data/hip_kernels/1499/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z27CudaPermuteWeightsPVToCudnnPfS_iiiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = mul i32 %4, %3
  %19 = mul i32 %18, %2
  %20 = mul i32 %19, %5
  %21 = mul i32 %20, %6
  %22 = mul i32 %21, %7
  %23 = icmp slt i32 %17, %22
  br i1 %23, label %24, label %52

24:                                               ; preds = %8
  %25 = mul nsw i32 %18, %5
  %26 = freeze i32 %17
  %27 = freeze i32 %25
  %28 = sdiv i32 %26, %27
  %29 = mul i32 %28, %27
  %30 = sub i32 %26, %29
  %31 = mul nsw i32 %5, %4
  %32 = sdiv i32 %30, %31
  %33 = srem i32 %17, %31
  %34 = sdiv i32 %33, %5
  %35 = srem i32 %17, %5
  %36 = mul i32 %5, %3
  %37 = mul i32 %36, %28
  %38 = mul nsw i32 %35, %18
  %39 = add nsw i32 %3, -1
  %40 = add i32 %39, %37
  %41 = sub i32 %40, %32
  %42 = mul i32 %41, %4
  %43 = xor i32 %34, -1
  %44 = add i32 %43, %4
  %45 = add i32 %44, %42
  %46 = add i32 %45, %38
  %47 = sext i32 %17 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = sext i32 %46 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  store float %49, float addrspace(1)* %51, align 4, !tbaa !7
  br label %52

52:                                               ; preds = %24, %8
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
