; ModuleID = '../data/hip_kernels/14012/14/main.cu'
source_filename = "../data/hip_kernels/14012/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13gpu_mix24_2_1PhjPiS0_iPtji(i8 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i16 addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
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
  br i1 %18, label %19, label %72

19:                                               ; preds = %8
  %20 = shl nsw i32 %17, 1
  %21 = mul nsw i32 %17, 3
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %22
  %24 = mul i32 %1, 3
  %25 = add i32 %24, -3
  %26 = mul i32 %17, %25
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %23, i64 %27
  %29 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !7, !amdgpu.noclobber !6
  %30 = zext i8 %29 to i32
  %31 = shl nuw nsw i32 %30, 16
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %28, i64 1
  %33 = load i8, i8 addrspace(1)* %32, align 1, !tbaa !7, !amdgpu.noclobber !6
  %34 = zext i8 %33 to i32
  %35 = shl nuw nsw i32 %34, 8
  %36 = or i32 %35, %31
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %28, i64 2
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7, !amdgpu.noclobber !6
  %39 = zext i8 %38 to i32
  %40 = or i32 %36, %39
  %41 = shl nuw i32 %40, 8
  %42 = ashr exact i32 %41, 8
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %28, i64 3
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !7, !amdgpu.noclobber !6
  %45 = zext i8 %44 to i32
  %46 = shl nuw nsw i32 %45, 16
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %43, i64 1
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7, !amdgpu.noclobber !6
  %49 = zext i8 %48 to i32
  %50 = shl nuw nsw i32 %49, 8
  %51 = or i32 %50, %46
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %43, i64 2
  %53 = load i8, i8 addrspace(1)* %52, align 1, !tbaa !7, !amdgpu.noclobber !6
  %54 = zext i8 %53 to i32
  %55 = or i32 %51, %54
  %56 = shl nuw i32 %55, 8
  %57 = ashr exact i32 %56, 8
  %58 = and i32 %40, %6
  %59 = trunc i32 %58 to i16
  %60 = sext i32 %20 to i64
  %61 = getelementptr inbounds i16, i16 addrspace(1)* %5, i64 %60
  store i16 %59, i16 addrspace(1)* %61, align 2, !tbaa !10
  %62 = and i32 %55, %6
  %63 = trunc i32 %62 to i16
  %64 = add nuw nsw i32 %20, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i16, i16 addrspace(1)* %5, i64 %65
  store i16 %63, i16 addrspace(1)* %66, align 2, !tbaa !10
  %67 = ashr i32 %42, %7
  %68 = ashr i32 %57, %7
  %69 = sext i32 %17 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %69
  store i32 %67, i32 addrspace(1)* %70, align 4, !tbaa !12
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %69
  store i32 %68, i32 addrspace(1)* %71, align 4, !tbaa !12
  br label %72

72:                                               ; preds = %19, %8
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
!11 = !{!"short", !8, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !8, i64 0}
