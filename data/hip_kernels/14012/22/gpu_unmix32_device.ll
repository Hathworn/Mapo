; ModuleID = '../data/hip_kernels/14012/22/main.cu'
source_filename = "../data/hip_kernels/14012/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11gpu_unmix32PiS_S_jPjS_S_Ptiij(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i16 addrspace(1)* nocapture readonly %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = and i32 %12, 7
  %14 = lshr i32 %12, 3
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul nuw nsw i32 %13, %20
  %22 = add nuw nsw i32 %21, %15
  %23 = zext i32 %14 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = icmp ult i32 %22, %25
  br i1 %26, label %27, label %102

27:                                               ; preds = %11
  %28 = shl nsw i32 %8, 3
  %29 = shl nuw nsw i32 %22, 1
  %30 = mul nsw i32 %14, %9
  %31 = sdiv i32 %30, 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %32
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %23
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %66, label %37

37:                                               ; preds = %27
  %38 = mul i32 %14, %10
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = zext i32 %22 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %40, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %39
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %44, i64 %41
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = add nsw i32 %46, %43
  %48 = mul nsw i32 %46, %35
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %23
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !6
  %51 = ashr i32 %48, %50
  %52 = sub i32 %47, %51
  %53 = sub nsw i32 %52, %46
  %54 = mul i32 %22, %3
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %33, i64 %55
  %57 = shl i32 %52, %28
  %58 = shl i32 %38, 1
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i16, i16 addrspace(1)* %7, i64 %59
  %61 = zext i32 %29 to i64
  %62 = getelementptr inbounds i16, i16 addrspace(1)* %60, i64 %61
  %63 = load i16, i16 addrspace(1)* %62, align 2, !tbaa !11, !amdgpu.noclobber !6
  %64 = zext i16 %63 to i32
  %65 = or i32 %57, %64
  store i32 %65, i32 addrspace(1)* %56, align 4, !tbaa !7
  br label %88

66:                                               ; preds = %27
  %67 = mul i32 %22, %3
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %33, i64 %68
  %70 = mul i32 %14, %10
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %71
  %73 = zext i32 %22 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %72, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !6
  %76 = shl i32 %75, %28
  %77 = shl i32 %70, 1
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i16, i16 addrspace(1)* %7, i64 %78
  %80 = zext i32 %29 to i64
  %81 = getelementptr inbounds i16, i16 addrspace(1)* %79, i64 %80
  %82 = load i16, i16 addrspace(1)* %81, align 2, !tbaa !11, !amdgpu.noclobber !6
  %83 = zext i16 %82 to i32
  %84 = or i32 %76, %83
  store i32 %84, i32 addrspace(1)* %69, align 4, !tbaa !7
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %85, i64 %73
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !7
  br label %88

88:                                               ; preds = %66, %37
  %89 = phi i32 [ %53, %37 ], [ %87, %66 ]
  %90 = phi i64 [ %59, %37 ], [ %78, %66 ]
  %91 = phi i64 [ %55, %37 ], [ %68, %66 ]
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %33, i64 %91
  %93 = getelementptr inbounds i16, i16 addrspace(1)* %7, i64 %90
  %94 = shl i32 %89, %28
  %95 = add nuw nsw i32 %29, 1
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i16, i16 addrspace(1)* %93, i64 %96
  %98 = load i16, i16 addrspace(1)* %97, align 2, !tbaa !11
  %99 = zext i16 %98 to i32
  %100 = or i32 %94, %99
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %92, i64 1
  store i32 %100, i32 addrspace(1)* %101, align 4, !tbaa !7
  br label %102

102:                                              ; preds = %88, %11
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
