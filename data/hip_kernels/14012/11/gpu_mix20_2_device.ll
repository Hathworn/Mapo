; ModuleID = '../data/hip_kernels/14012/11/main.cu'
source_filename = "../data/hip_kernels/14012/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11gpu_mix20_2PhjPiS0_i(i8 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = icmp slt i32 %14, %4
  br i1 %15, label %16, label %57

16:                                               ; preds = %5
  %17 = mul nsw i32 %14, 3
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %18
  %20 = mul i32 %1, 3
  %21 = add i32 %20, -3
  %22 = mul i32 %14, %21
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %19, i64 %23
  %25 = load i8, i8 addrspace(1)* %24, align 1, !tbaa !7, !amdgpu.noclobber !6
  %26 = zext i8 %25 to i32
  %27 = shl nuw nsw i32 %26, 16
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %24, i64 1
  %29 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !7, !amdgpu.noclobber !6
  %30 = zext i8 %29 to i32
  %31 = shl nuw nsw i32 %30, 8
  %32 = or i32 %31, %27
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %24, i64 2
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !7, !amdgpu.noclobber !6
  %35 = zext i8 %34 to i32
  %36 = or i32 %32, %35
  %37 = shl nuw i32 %36, 8
  %38 = ashr i32 %37, 12
  %39 = sext i32 %14 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %39
  store i32 %38, i32 addrspace(1)* %40, align 4, !tbaa !10
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %24, i64 3
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !7
  %43 = zext i8 %42 to i32
  %44 = shl nuw nsw i32 %43, 16
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %41, i64 1
  %46 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !7
  %47 = zext i8 %46 to i32
  %48 = shl nuw nsw i32 %47, 8
  %49 = or i32 %48, %44
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %41, i64 2
  %51 = load i8, i8 addrspace(1)* %50, align 1, !tbaa !7
  %52 = zext i8 %51 to i32
  %53 = or i32 %49, %52
  %54 = shl nuw i32 %53, 8
  %55 = ashr i32 %54, 12
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %39
  store i32 %55, i32 addrspace(1)* %56, align 4, !tbaa !10
  br label %57

57:                                               ; preds = %16, %5
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
