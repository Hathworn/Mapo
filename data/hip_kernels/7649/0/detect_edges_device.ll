; ModuleID = '../data/hip_kernels/7649/0/main.cu'
source_filename = "../data/hip_kernels/7649/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12detect_edgesPhS_(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = mul i32 %3, 72
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = add i32 %4, %5
  %7 = freeze i32 %6
  %8 = srem i32 %7, 100
  %9 = icmp eq i32 %8, 0
  %10 = add i32 %7, 99
  %11 = icmp ult i32 %10, 199
  %12 = or i1 %9, %11
  %13 = icmp eq i32 %8, 99
  %14 = or i1 %13, %12
  %15 = add i32 %7, -7100
  %16 = icmp ult i32 %15, 100
  %17 = or i1 %16, %14
  br i1 %17, label %18, label %21

18:                                               ; preds = %2
  %19 = sext i32 %7 to i64
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %19
  store i8 0, i8 addrspace(1)* %20, align 1, !tbaa !5
  br label %54

21:                                               ; preds = %2
  %22 = add nsw i32 %7, 100
  %23 = add nsw i32 %7, -1
  %24 = add nuw nsw i32 %7, 1
  %25 = add nsw i32 %7, -100
  %26 = sext i32 %7 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %26
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !5, !amdgpu.noclobber !8
  %29 = zext i8 %28 to i32
  %30 = shl nuw nsw i32 %29, 2
  %31 = sext i32 %22 to i64
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %31
  %33 = load i8, i8 addrspace(1)* %32, align 1, !tbaa !5, !amdgpu.noclobber !8
  %34 = zext i8 %33 to i32
  %35 = sext i32 %23 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !5, !amdgpu.noclobber !8
  %38 = zext i8 %37 to i32
  %39 = add nuw nsw i32 %38, %34
  %40 = sext i32 %24 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !5, !amdgpu.noclobber !8
  %43 = zext i8 %42 to i32
  %44 = add nuw nsw i32 %39, %43
  %45 = sext i32 %25 to i64
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %45
  %47 = load i8, i8 addrspace(1)* %46, align 1, !tbaa !5, !amdgpu.noclobber !8
  %48 = zext i8 %47 to i32
  %49 = add nuw nsw i32 %44, %48
  %50 = icmp ult i32 %30, %49
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %26
  br i1 %50, label %53, label %52

52:                                               ; preds = %21
  store i8 -1, i8 addrspace(1)* %51, align 1, !tbaa !5
  br label %54

53:                                               ; preds = %21
  store i8 0, i8 addrspace(1)* %51, align 1, !tbaa !5
  br label %54

54:                                               ; preds = %52, %53, %18
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
