; ModuleID = '../data/hip_kernels/7064/38/main.cu'
source_filename = "../data/hip_kernels/7064/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18gMaxPoolingForwardPfiiS_iiS_iiii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %12
  %21 = mul nsw i32 %2, %1
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %158

23:                                               ; preds = %11
  %24 = freeze i32 %20
  %25 = freeze i32 %1
  %26 = sdiv i32 %24, %25
  %27 = mul i32 %26, %25
  %28 = sub i32 %24, %27
  %29 = mul nsw i32 %26, %5
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %3, i64 %30
  %32 = mul nsw i32 %28, %9
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %31, i64 %33
  %35 = sdiv i32 %26, %7
  %36 = mul nsw i32 %35, %8
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %6, i64 %37
  %39 = getelementptr inbounds float, float addrspace(1)* %38, i64 %33
  %40 = add nsw i32 %1, -1
  %41 = icmp eq i32 %28, %40
  %42 = select i1 %41, i32 %10, i32 %9
  %43 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !6
  %45 = fmul contract float %43, %44
  %46 = icmp sgt i32 %42, 1
  br i1 %46, label %47, label %74

47:                                               ; preds = %23
  %48 = add i32 %42, -1
  %49 = add i32 %42, -2
  %50 = and i32 %48, 7
  %51 = icmp ult i32 %49, 7
  br i1 %51, label %54, label %52

52:                                               ; preds = %47
  %53 = and i32 %48, -8
  br label %80

54:                                               ; preds = %80, %47
  %55 = phi float [ undef, %47 ], [ %154, %80 ]
  %56 = phi i32 [ 1, %47 ], [ %155, %80 ]
  %57 = phi float [ %45, %47 ], [ %154, %80 ]
  %58 = icmp eq i32 %50, 0
  br i1 %58, label %74, label %59

59:                                               ; preds = %54, %59
  %60 = phi i32 [ %71, %59 ], [ %56, %54 ]
  %61 = phi float [ %70, %59 ], [ %57, %54 ]
  %62 = phi i32 [ %72, %59 ], [ 0, %54 ]
  %63 = zext i32 %60 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %34, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = getelementptr inbounds float, float addrspace(1)* %39, i64 %63
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  %68 = fmul contract float %65, %67
  %69 = fcmp contract ogt float %68, %61
  %70 = select i1 %69, float %68, float %61
  %71 = add nuw nsw i32 %60, 1
  %72 = add i32 %62, 1
  %73 = icmp eq i32 %72, %50
  br i1 %73, label %74, label %59, !llvm.loop !11

74:                                               ; preds = %54, %59, %23
  %75 = phi float [ %45, %23 ], [ %55, %54 ], [ %70, %59 ]
  %76 = mul nsw i32 %28, %2
  %77 = add nsw i32 %76, %26
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  store float %75, float addrspace(1)* %79, align 4, !tbaa !7
  br label %158

80:                                               ; preds = %80, %52
  %81 = phi i32 [ 1, %52 ], [ %155, %80 ]
  %82 = phi float [ %45, %52 ], [ %154, %80 ]
  %83 = phi i32 [ 0, %52 ], [ %156, %80 ]
  %84 = zext i32 %81 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %34, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = getelementptr inbounds float, float addrspace(1)* %39, i64 %84
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !6
  %89 = fmul contract float %86, %88
  %90 = fcmp contract ogt float %89, %82
  %91 = select i1 %90, float %89, float %82
  %92 = add nuw nsw i32 %81, 1
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %34, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !6
  %96 = getelementptr inbounds float, float addrspace(1)* %39, i64 %93
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !6
  %98 = fmul contract float %95, %97
  %99 = fcmp contract ogt float %98, %91
  %100 = select i1 %99, float %98, float %91
  %101 = add nuw nsw i32 %81, 2
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %34, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !6
  %105 = getelementptr inbounds float, float addrspace(1)* %39, i64 %102
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !6
  %107 = fmul contract float %104, %106
  %108 = fcmp contract ogt float %107, %100
  %109 = select i1 %108, float %107, float %100
  %110 = add nuw nsw i32 %81, 3
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %34, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !6
  %114 = getelementptr inbounds float, float addrspace(1)* %39, i64 %111
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !6
  %116 = fmul contract float %113, %115
  %117 = fcmp contract ogt float %116, %109
  %118 = select i1 %117, float %116, float %109
  %119 = add nuw nsw i32 %81, 4
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %34, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !6
  %123 = getelementptr inbounds float, float addrspace(1)* %39, i64 %120
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !6
  %125 = fmul contract float %122, %124
  %126 = fcmp contract ogt float %125, %118
  %127 = select i1 %126, float %125, float %118
  %128 = add nuw nsw i32 %81, 5
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %34, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !6
  %132 = getelementptr inbounds float, float addrspace(1)* %39, i64 %129
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !6
  %134 = fmul contract float %131, %133
  %135 = fcmp contract ogt float %134, %127
  %136 = select i1 %135, float %134, float %127
  %137 = add nuw nsw i32 %81, 6
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %34, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !6
  %141 = getelementptr inbounds float, float addrspace(1)* %39, i64 %138
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !6
  %143 = fmul contract float %140, %142
  %144 = fcmp contract ogt float %143, %136
  %145 = select i1 %144, float %143, float %136
  %146 = add nuw nsw i32 %81, 7
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %34, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7, !amdgpu.noclobber !6
  %150 = getelementptr inbounds float, float addrspace(1)* %39, i64 %147
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !6
  %152 = fmul contract float %149, %151
  %153 = fcmp contract ogt float %152, %145
  %154 = select i1 %153, float %152, float %145
  %155 = add nuw nsw i32 %81, 8
  %156 = add i32 %83, 8
  %157 = icmp eq i32 %156, %53
  br i1 %157, label %54, label %80, !llvm.loop !13

158:                                              ; preds = %11, %74
  ret void
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
