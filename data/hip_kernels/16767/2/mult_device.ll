; ModuleID = '../data/hip_kernels/16767/2/main.cu'
source_filename = "../data/hip_kernels/16767/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@cuda_features = protected addrspace(4) externally_initialized global i32 5, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @cuda_features to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4multPiS_S_(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = load i32, i32 addrspace(4)* @cuda_features, align 4, !tbaa !7
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %42

15:                                               ; preds = %3
  %16 = mul nsw i32 %13, %12
  %17 = and i32 %13, 7
  %18 = icmp ult i32 %13, 8
  br i1 %18, label %21, label %19

19:                                               ; preds = %15
  %20 = and i32 %13, -8
  br label %46

21:                                               ; preds = %46, %15
  %22 = phi i32 [ undef, %15 ], [ %128, %46 ]
  %23 = phi i32 [ 0, %15 ], [ %129, %46 ]
  %24 = phi i32 [ 0, %15 ], [ %128, %46 ]
  %25 = icmp eq i32 %17, 0
  br i1 %25, label %42, label %26

26:                                               ; preds = %21, %26
  %27 = phi i32 [ %39, %26 ], [ %23, %21 ]
  %28 = phi i32 [ %38, %26 ], [ %24, %21 ]
  %29 = phi i32 [ %40, %26 ], [ 0, %21 ]
  %30 = zext i32 %27 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = add nsw i32 %16, %27
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = mul nsw i32 %36, %32
  %38 = add nsw i32 %37, %28
  %39 = add nuw nsw i32 %27, 1
  %40 = add i32 %29, 1
  %41 = icmp eq i32 %40, %17
  br i1 %41, label %42, label %26, !llvm.loop !11

42:                                               ; preds = %21, %26, %3
  %43 = phi i32 [ 0, %3 ], [ %22, %21 ], [ %38, %26 ]
  %44 = sext i32 %12 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  store i32 %43, i32 addrspace(1)* %45, align 4, !tbaa !7
  ret void

46:                                               ; preds = %46, %19
  %47 = phi i32 [ 0, %19 ], [ %129, %46 ]
  %48 = phi i32 [ 0, %19 ], [ %128, %46 ]
  %49 = phi i32 [ 0, %19 ], [ %130, %46 ]
  %50 = zext i32 %47 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = add nsw i32 %16, %47
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = mul nsw i32 %56, %52
  %58 = add nsw i32 %57, %48
  %59 = or i32 %47, 1
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = add nsw i32 %16, %59
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = mul nsw i32 %66, %62
  %68 = add nsw i32 %67, %58
  %69 = or i32 %47, 2
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = add nsw i32 %16, %69
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = mul nsw i32 %76, %72
  %78 = add nsw i32 %77, %68
  %79 = or i32 %47, 3
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = add nsw i32 %16, %79
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = mul nsw i32 %86, %82
  %88 = add nsw i32 %87, %78
  %89 = or i32 %47, 4
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = add nsw i32 %16, %89
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = mul nsw i32 %96, %92
  %98 = add nsw i32 %97, %88
  %99 = or i32 %47, 5
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = add nsw i32 %16, %99
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = mul nsw i32 %106, %102
  %108 = add nsw i32 %107, %98
  %109 = or i32 %47, 6
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = add nsw i32 %16, %109
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = mul nsw i32 %116, %112
  %118 = add nsw i32 %117, %108
  %119 = or i32 %47, 7
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %120
  %122 = load i32, i32 addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = add nsw i32 %16, %119
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %124
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = mul nsw i32 %126, %122
  %128 = add nsw i32 %127, %118
  %129 = add nuw nsw i32 %47, 8
  %130 = add i32 %49, 8
  %131 = icmp eq i32 %130, %20
  br i1 %131, label %21, label %46, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
