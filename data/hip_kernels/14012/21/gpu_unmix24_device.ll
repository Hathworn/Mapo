; ModuleID = '../data/hip_kernels/14012/21/main.cu'
source_filename = "../data/hip_kernels/14012/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11gpu_unmix24PiS_PhjPjS_S_Ptiij(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture writeonly %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i16 addrspace(1)* nocapture readonly %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
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
  br i1 %26, label %27, label %96

27:                                               ; preds = %11
  %28 = shl nsw i32 %8, 3
  %29 = shl nuw nsw i32 %22, 1
  %30 = mul nsw i32 %14, %9
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %31
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %23
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = icmp eq i32 %34, 0
  %36 = mul i32 %14, %10
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  %39 = zext i32 %22 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %37
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %42, i64 %39
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7
  br i1 %35, label %53, label %45

45:                                               ; preds = %27
  %46 = add nsw i32 %44, %41
  %47 = mul nsw i32 %44, %34
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %23
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = ashr i32 %47, %49
  %51 = sub i32 %46, %50
  %52 = sub nsw i32 %51, %44
  br label %53

53:                                               ; preds = %27, %45
  %54 = phi i32 [ %51, %45 ], [ %41, %27 ]
  %55 = phi i32 [ %52, %45 ], [ %44, %27 ]
  %56 = shl i32 %54, %28
  %57 = shl i32 %36, 1
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i16, i16 addrspace(1)* %7, i64 %58
  %60 = zext i32 %29 to i64
  %61 = getelementptr inbounds i16, i16 addrspace(1)* %59, i64 %60
  %62 = load i16, i16 addrspace(1)* %61, align 2, !tbaa !11
  %63 = zext i16 %62 to i32
  %64 = shl i32 %55, %28
  %65 = getelementptr inbounds i16, i16 addrspace(1)* %7, i64 %58
  %66 = add nuw nsw i32 %29, 1
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds i16, i16 addrspace(1)* %65, i64 %67
  %69 = load i16, i16 addrspace(1)* %68, align 2, !tbaa !11
  %70 = zext i16 %69 to i32
  %71 = or i32 %64, %70
  %72 = mul nuw nsw i32 %22, 3
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %32, i64 %73
  %75 = mul i32 %3, 3
  %76 = add i32 %75, -3
  %77 = mul i32 %22, %76
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %74, i64 %78
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %79, i64 3
  %81 = or i32 %56, %63
  %82 = lshr i32 %56, 16
  %83 = lshr i32 %81, 8
  %84 = lshr i32 %64, 16
  %85 = insertelement <4 x i32> poison, i32 %82, i64 0
  %86 = insertelement <4 x i32> %85, i32 %83, i64 1
  %87 = insertelement <4 x i32> %86, i32 %81, i64 2
  %88 = insertelement <4 x i32> %87, i32 %84, i64 3
  %89 = trunc <4 x i32> %88 to <4 x i8>
  %90 = bitcast i8 addrspace(1)* %79 to <4 x i8> addrspace(1)*
  store <4 x i8> %89, <4 x i8> addrspace(1)* %90, align 1, !tbaa !13
  %91 = lshr i32 %71, 8
  %92 = trunc i32 %91 to i8
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %80, i64 1
  store i8 %92, i8 addrspace(1)* %93, align 1, !tbaa !13
  %94 = trunc i32 %71 to i8
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %80, i64 2
  store i8 %94, i8 addrspace(1)* %95, align 1, !tbaa !13
  br label %96

96:                                               ; preds = %53, %11
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
!13 = !{!9, !9, i64 0}
