; ModuleID = '../data/hip_kernels/11742/1/main.cu'
source_filename = "../data/hip_kernels/11742/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14fastForwardDstPKsPsi(i16 addrspace(1)* nocapture readonly %0, i16 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = add nsw i32 %2, -1
  %5 = shl nuw i32 1, %4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = shl nuw nsw i32 %6, 2
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %8
  %10 = load i16, i16 addrspace(1)* %9, align 2, !tbaa !5, !amdgpu.noclobber !9
  %11 = sext i16 %10 to i32
  %12 = add nuw nsw i32 %7, 3
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %13
  %15 = load i16, i16 addrspace(1)* %14, align 2, !tbaa !5, !amdgpu.noclobber !9
  %16 = sext i16 %15 to i32
  %17 = add nsw i32 %16, %11
  %18 = add nuw nsw i32 %7, 1
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %19
  %21 = load i16, i16 addrspace(1)* %20, align 2, !tbaa !5, !amdgpu.noclobber !9
  %22 = sext i16 %21 to i32
  %23 = add nsw i32 %22, %16
  %24 = sub nsw i32 %11, %22
  %25 = add nuw nsw i32 %7, 2
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %26
  %28 = load i16, i16 addrspace(1)* %27, align 2, !tbaa !5, !amdgpu.noclobber !9
  %29 = sext i16 %28 to i32
  %30 = mul nsw i32 %29, 74
  %31 = mul nsw i32 %17, 29
  %32 = mul nsw i32 %23, 55
  %33 = add i32 %30, %5
  %34 = add i32 %33, %31
  %35 = add i32 %34, %32
  %36 = ashr i32 %35, %2
  %37 = trunc i32 %36 to i16
  %38 = zext i32 %6 to i64
  %39 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %38
  store i16 %37, i16 addrspace(1)* %39, align 2, !tbaa !5
  %40 = load i16, i16 addrspace(1)* %9, align 2, !tbaa !5
  %41 = sext i16 %40 to i32
  %42 = load i16, i16 addrspace(1)* %20, align 2, !tbaa !5
  %43 = sext i16 %42 to i32
  %44 = add nsw i32 %43, %41
  %45 = load i16, i16 addrspace(1)* %14, align 2, !tbaa !5
  %46 = sext i16 %45 to i32
  %47 = sub nsw i32 %44, %46
  %48 = mul nsw i32 %47, 74
  %49 = add nsw i32 %48, %5
  %50 = ashr i32 %49, %2
  %51 = trunc i32 %50 to i16
  %52 = add nuw nsw i32 %6, 4
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %53
  store i16 %51, i16 addrspace(1)* %54, align 2, !tbaa !5
  %55 = mul nsw i32 %24, 29
  %56 = mul nsw i32 %17, 55
  %57 = add i32 %56, %5
  %58 = add i32 %57, %55
  %59 = sub i32 %58, %30
  %60 = ashr i32 %59, %2
  %61 = trunc i32 %60 to i16
  %62 = add nuw nsw i32 %6, 8
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %63
  store i16 %61, i16 addrspace(1)* %64, align 2, !tbaa !5
  %65 = mul nsw i32 %24, 55
  %66 = mul nsw i32 %23, -29
  %67 = add i32 %33, %65
  %68 = add i32 %67, %66
  %69 = ashr i32 %68, %2
  %70 = trunc i32 %69 to i16
  %71 = add nuw nsw i32 %6, 12
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %72
  store i16 %70, i16 addrspace(1)* %73, align 2, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
