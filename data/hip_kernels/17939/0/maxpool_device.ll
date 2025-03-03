; ModuleID = '../data/hip_kernels/17939/0/main.cu'
source_filename = "../data/hip_kernels/17939/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7maxpoolPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %6, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp sgt i32 %3, 0
  br i1 %22, label %23, label %34

23:                                               ; preds = %4
  %24 = mul i32 %21, %3
  %25 = mul nsw i32 %13, %3
  %26 = and i32 %3, 7
  %27 = icmp ult i32 %3, 8
  %28 = and i32 %3, -8
  %29 = icmp eq i32 %26, 0
  br label %30

30:                                               ; preds = %23, %59
  %31 = phi i32 [ 0, %23 ], [ %61, %59 ]
  %32 = phi float [ 0xC12E847FC0000000, %23 ], [ %60, %59 ]
  %33 = add i32 %31, %25
  br i1 %27, label %40, label %63

34:                                               ; preds = %59, %4
  %35 = phi float [ 0xC12E847FC0000000, %4 ], [ %60, %59 ]
  %36 = sdiv i32 %2, %3
  %37 = icmp slt i32 %13, %36
  %38 = icmp slt i32 %21, %36
  %39 = select i1 %37, i1 %38, i1 false
  br i1 %39, label %141, label %146

40:                                               ; preds = %63, %30
  %41 = phi float [ undef, %30 ], [ %137, %63 ]
  %42 = phi i32 [ 0, %30 ], [ %138, %63 ]
  %43 = phi float [ %32, %30 ], [ %137, %63 ]
  br i1 %29, label %59, label %44

44:                                               ; preds = %40, %44
  %45 = phi i32 [ %56, %44 ], [ %42, %40 ]
  %46 = phi float [ %55, %44 ], [ %43, %40 ]
  %47 = phi i32 [ %57, %44 ], [ 0, %40 ]
  %48 = add i32 %45, %24
  %49 = mul i32 %48, %2
  %50 = add i32 %33, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = fcmp contract olt float %46, %53
  %55 = select i1 %54, float %53, float %46
  %56 = add nuw nsw i32 %45, 1
  %57 = add i32 %47, 1
  %58 = icmp eq i32 %57, %26
  br i1 %58, label %59, label %44, !llvm.loop !11

59:                                               ; preds = %44, %40
  %60 = phi float [ %41, %40 ], [ %55, %44 ]
  %61 = add nuw nsw i32 %31, 1
  %62 = icmp eq i32 %61, %3
  br i1 %62, label %34, label %30, !llvm.loop !13

63:                                               ; preds = %30, %63
  %64 = phi i32 [ %138, %63 ], [ 0, %30 ]
  %65 = phi float [ %137, %63 ], [ %32, %30 ]
  %66 = phi i32 [ %139, %63 ], [ 0, %30 ]
  %67 = add i32 %64, %24
  %68 = mul i32 %67, %2
  %69 = add i32 %33, %68
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = fcmp contract olt float %65, %72
  %74 = select i1 %73, float %72, float %65
  %75 = or i32 %64, 1
  %76 = add i32 %75, %24
  %77 = mul i32 %76, %2
  %78 = add i32 %33, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = fcmp contract olt float %74, %81
  %83 = select i1 %82, float %81, float %74
  %84 = or i32 %64, 2
  %85 = add i32 %84, %24
  %86 = mul i32 %85, %2
  %87 = add i32 %33, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = fcmp contract olt float %83, %90
  %92 = select i1 %91, float %90, float %83
  %93 = or i32 %64, 3
  %94 = add i32 %93, %24
  %95 = mul i32 %94, %2
  %96 = add i32 %33, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = fcmp contract olt float %92, %99
  %101 = select i1 %100, float %99, float %92
  %102 = or i32 %64, 4
  %103 = add i32 %102, %24
  %104 = mul i32 %103, %2
  %105 = add i32 %33, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = fcmp contract olt float %101, %108
  %110 = select i1 %109, float %108, float %101
  %111 = or i32 %64, 5
  %112 = add i32 %111, %24
  %113 = mul i32 %112, %2
  %114 = add i32 %33, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = fcmp contract olt float %110, %117
  %119 = select i1 %118, float %117, float %110
  %120 = or i32 %64, 6
  %121 = add i32 %120, %24
  %122 = mul i32 %121, %2
  %123 = add i32 %33, %122
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fcmp contract olt float %119, %126
  %128 = select i1 %127, float %126, float %119
  %129 = or i32 %64, 7
  %130 = add i32 %129, %24
  %131 = mul i32 %130, %2
  %132 = add i32 %33, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7, !amdgpu.noclobber !5
  %136 = fcmp contract olt float %128, %135
  %137 = select i1 %136, float %135, float %128
  %138 = add nuw nsw i32 %64, 8
  %139 = add i32 %66, 8
  %140 = icmp eq i32 %139, %28
  br i1 %140, label %40, label %63, !llvm.loop !15

141:                                              ; preds = %34
  %142 = mul nsw i32 %36, %21
  %143 = add nsw i32 %142, %13
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  store float %35, float addrspace(1)* %145, align 4, !tbaa !7
  br label %146

146:                                              ; preds = %141, %34
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
