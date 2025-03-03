; ModuleID = '../data/hip_kernels/14012/19/main.cu'
source_filename = "../data/hip_kernels/14012/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11gpu_unmix16PiS_PsjPjS_S_ij(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i16 addrspace(1)* nocapture writeonly %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = and i32 %10, 7
  %12 = lshr i32 %10, 3
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul nuw nsw i32 %11, %18
  %20 = add nuw nsw i32 %19, %13
  %21 = zext i32 %12 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !6
  %24 = icmp ult i32 %20, %23
  br i1 %24, label %25, label %74

25:                                               ; preds = %9
  %26 = mul nsw i32 %12, %7
  %27 = sdiv i32 %26, 2
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i16, i16 addrspace(1)* %2, i64 %28
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %21
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %54, label %33

33:                                               ; preds = %25
  %34 = mul i32 %12, %8
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = zext i32 %20 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %36, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !6
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %40, i64 %37
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !6
  %43 = add nsw i32 %42, %39
  %44 = mul nsw i32 %42, %31
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %21
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = ashr i32 %44, %46
  %48 = sub i32 %43, %47
  %49 = sub nsw i32 %48, %42
  %50 = mul i32 %20, %3
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i16, i16 addrspace(1)* %29, i64 %51
  %53 = trunc i32 %48 to i16
  store i16 %53, i16 addrspace(1)* %52, align 2, !tbaa !11
  br label %68

54:                                               ; preds = %25
  %55 = mul i32 %20, %3
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i16, i16 addrspace(1)* %29, i64 %56
  %58 = mul i32 %12, %8
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %59
  %61 = zext i32 %20 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %60, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !6
  %64 = trunc i32 %63 to i16
  store i16 %64, i16 addrspace(1)* %57, align 2, !tbaa !11
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %65, i64 %61
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %68

68:                                               ; preds = %54, %33
  %69 = phi i32 [ %49, %33 ], [ %67, %54 ]
  %70 = phi i64 [ %51, %33 ], [ %56, %54 ]
  %71 = getelementptr inbounds i16, i16 addrspace(1)* %29, i64 %70
  %72 = trunc i32 %69 to i16
  %73 = getelementptr inbounds i16, i16 addrspace(1)* %71, i64 1
  store i16 %72, i16 addrspace(1)* %73, align 2, !tbaa !11
  br label %74

74:                                               ; preds = %68, %9
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"short", !9, i64 0}
