; ModuleID = '../data/hip_kernels/14012/20/main.cu'
source_filename = "../data/hip_kernels/14012/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11gpu_unmix20PiS_PhjPjS_S_ij(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture writeonly %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
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
  br i1 %24, label %25, label %97

25:                                               ; preds = %9
  %26 = mul nsw i32 %12, %7
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %27
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %21
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  %31 = icmp eq i32 %30, 0
  %32 = mul i32 %12, %8
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = zext i32 %20 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %34, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  br i1 %31, label %65, label %38

38:                                               ; preds = %25
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %33
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %35
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !6
  %42 = add nsw i32 %41, %37
  %43 = mul nsw i32 %41, %30
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %21
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !6
  %46 = ashr i32 %43, %45
  %47 = sub i32 %42, %46
  %48 = sub nsw i32 %47, %41
  %49 = shl i32 %47, 4
  %50 = mul nuw nsw i32 %20, 3
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %28, i64 %51
  %53 = mul i32 %3, 3
  %54 = add i32 %53, -3
  %55 = mul i32 %20, %54
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %52, i64 %56
  %58 = lshr i32 %49, 16
  %59 = trunc i32 %58 to i8
  store i8 %59, i8 addrspace(1)* %57, align 1, !tbaa !11
  %60 = lshr i32 %49, 8
  %61 = trunc i32 %60 to i8
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %57, i64 1
  store i8 %61, i8 addrspace(1)* %62, align 1, !tbaa !11
  %63 = trunc i32 %49 to i8
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %57, i64 2
  store i8 %63, i8 addrspace(1)* %64, align 1, !tbaa !11
  br label %85

65:                                               ; preds = %25
  %66 = shl i32 %37, 4
  %67 = mul nuw nsw i32 %20, 3
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %28, i64 %68
  %70 = mul i32 %3, 3
  %71 = add i32 %70, -3
  %72 = mul i32 %20, %71
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %69, i64 %73
  %75 = lshr i32 %66, 16
  %76 = trunc i32 %75 to i8
  store i8 %76, i8 addrspace(1)* %74, align 1, !tbaa !11
  %77 = lshr i32 %66, 8
  %78 = trunc i32 %77 to i8
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %74, i64 1
  store i8 %78, i8 addrspace(1)* %79, align 1, !tbaa !11
  %80 = trunc i32 %66 to i8
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %74, i64 2
  store i8 %80, i8 addrspace(1)* %81, align 1, !tbaa !11
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %33
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %82, i64 %35
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !7
  br label %85

85:                                               ; preds = %65, %38
  %86 = phi i32 [ %48, %38 ], [ %84, %65 ]
  %87 = phi i8 addrspace(1)* [ %57, %38 ], [ %74, %65 ]
  %88 = getelementptr inbounds i8, i8 addrspace(1)* %87, i64 3
  %89 = shl i32 %86, 4
  %90 = lshr i32 %89, 16
  %91 = trunc i32 %90 to i8
  store i8 %91, i8 addrspace(1)* %88, align 1, !tbaa !11
  %92 = lshr i32 %89, 8
  %93 = trunc i32 %92 to i8
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %87, i64 4
  store i8 %93, i8 addrspace(1)* %94, align 1, !tbaa !11
  %95 = trunc i32 %89 to i8
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %87, i64 5
  store i8 %95, i8 addrspace(1)* %96, align 1, !tbaa !11
  br label %97

97:                                               ; preds = %85, %9
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
!11 = !{!9, !9, i64 0}
