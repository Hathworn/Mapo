; ModuleID = '../data/hip_kernels/14012/13/main.cu'
source_filename = "../data/hip_kernels/14012/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13gpu_mix24_1_2PhjPiS0_iiii(i8 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = icmp slt i32 %17, %4
  br i1 %18, label %19, label %65

19:                                               ; preds = %8
  %20 = mul nsw i32 %17, 3
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %21
  %23 = mul i32 %1, 3
  %24 = add i32 %23, -3
  %25 = mul i32 %17, %24
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %22, i64 %26
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !7, !amdgpu.noclobber !6
  %29 = zext i8 %28 to i32
  %30 = shl nuw nsw i32 %29, 16
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 1
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !7, !amdgpu.noclobber !6
  %33 = zext i8 %32 to i32
  %34 = shl nuw nsw i32 %33, 8
  %35 = or i32 %34, %30
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 2
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !7, !amdgpu.noclobber !6
  %38 = zext i8 %37 to i32
  %39 = or i32 %35, %38
  %40 = shl nuw i32 %39, 8
  %41 = ashr exact i32 %40, 8
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %27, i64 3
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !7, !amdgpu.noclobber !6
  %44 = zext i8 %43 to i32
  %45 = shl nuw nsw i32 %44, 16
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %42, i64 1
  %47 = load i8, i8 addrspace(1)* %46, align 1, !tbaa !7, !amdgpu.noclobber !6
  %48 = zext i8 %47 to i32
  %49 = shl nuw nsw i32 %48, 8
  %50 = or i32 %49, %45
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %42, i64 2
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7, !amdgpu.noclobber !6
  %53 = zext i8 %52 to i32
  %54 = or i32 %50, %53
  %55 = shl nuw i32 %54, 8
  %56 = ashr exact i32 %55, 8
  %57 = mul nsw i32 %41, %5
  %58 = mul nsw i32 %56, %6
  %59 = add nsw i32 %58, %57
  %60 = ashr i32 %59, %7
  %61 = sext i32 %17 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %61
  store i32 %60, i32 addrspace(1)* %62, align 4, !tbaa !10
  %63 = sub nsw i32 %41, %56
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %61
  store i32 %63, i32 addrspace(1)* %64, align 4, !tbaa !10
  br label %65

65:                                               ; preds = %19, %8
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
