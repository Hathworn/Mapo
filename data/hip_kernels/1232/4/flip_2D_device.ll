; ModuleID = '../data/hip_kernels/1232/4/main.cu'
source_filename = "../data/hip_kernels/1232/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z7flip_2DPfmmii(float addrspace(1)* nocapture %0, i64 %1, i64 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = zext i32 %14 to i64
  %16 = mul i64 %2, %1
  %17 = freeze i64 %15
  %18 = freeze i64 %2
  %19 = udiv i64 %17, %18
  %20 = mul i64 %19, %18
  %21 = sub i64 %17, %20
  %22 = icmp ugt i64 %16, %15
  br i1 %22, label %23, label %55

23:                                               ; preds = %5
  %24 = icmp ne i32 %4, 0
  %25 = lshr i64 %2, 1
  %26 = icmp ult i64 %21, %25
  %27 = select i1 %24, i1 %26, i1 false
  br i1 %27, label %28, label %39

28:                                               ; preds = %23
  %29 = mul i64 %19, %2
  %30 = add i64 %29, %16
  %31 = add i64 %30, %21
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = xor i64 %21, -1
  %34 = add i64 %33, %2
  %35 = add i64 %34, %30
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %38, float addrspace(1)* %32, align 4, !tbaa !7
  store float %37, float addrspace(1)* %36, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %39

39:                                               ; preds = %28, %23
  %40 = icmp ne i32 %3, 0
  %41 = lshr i64 %1, 1
  %42 = icmp ult i64 %19, %41
  %43 = select i1 %40, i1 %42, i1 false
  br i1 %43, label %44, label %55

44:                                               ; preds = %39
  %45 = mul i64 %19, %2
  %46 = add i64 %45, %21
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = xor i64 %19, -1
  %49 = add i64 %48, %1
  %50 = mul i64 %49, %2
  %51 = add i64 %50, %21
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %54 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  store float %54, float addrspace(1)* %47, align 4, !tbaa !7
  store float %53, float addrspace(1)* %52, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %55

55:                                               ; preds = %39, %44, %5
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
