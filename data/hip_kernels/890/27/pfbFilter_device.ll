; ModuleID = '../data/hip_kernels/890/27/main.cu'
source_filename = "../data/hip_kernels/890/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9pfbFilterPfS_S_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %6, %16
  %18 = add i32 %17, %12
  %19 = mul i32 %18, %10
  %20 = add i32 %19, %11
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = zext i32 %11 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = fmul contract float %23, %26
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  store float %27, float addrspace(1)* %28, align 4, !tbaa !7
  %29 = icmp sgt i32 %3, 1
  br i1 %29, label %30, label %59

30:                                               ; preds = %4
  %31 = add i32 %3, -1
  %32 = add i32 %3, -2
  %33 = and i32 %31, 7
  %34 = icmp ult i32 %32, 7
  br i1 %34, label %37, label %35

35:                                               ; preds = %30
  %36 = and i32 %31, -8
  br label %60

37:                                               ; preds = %60, %30
  %38 = phi float [ %27, %30 ], [ %158, %60 ]
  %39 = phi i32 [ 1, %30 ], [ %159, %60 ]
  %40 = icmp eq i32 %33, 0
  br i1 %40, label %59, label %41

41:                                               ; preds = %37, %41
  %42 = phi float [ %55, %41 ], [ %38, %37 ]
  %43 = phi i32 [ %56, %41 ], [ %39, %37 ]
  %44 = phi i32 [ %57, %41 ], [ 0, %37 ]
  %45 = mul nuw nsw i32 %43, %10
  %46 = add nsw i32 %45, %20
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = add nuw i32 %45, %11
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %54 = fmul contract float %49, %53
  %55 = fadd contract float %42, %54
  store float %55, float addrspace(1)* %28, align 4, !tbaa !7
  %56 = add nuw nsw i32 %43, 1
  %57 = add i32 %44, 1
  %58 = icmp eq i32 %57, %33
  br i1 %58, label %59, label %41, !llvm.loop !11

59:                                               ; preds = %37, %41, %4
  ret void

60:                                               ; preds = %60, %35
  %61 = phi float [ %27, %35 ], [ %158, %60 ]
  %62 = phi i32 [ 1, %35 ], [ %159, %60 ]
  %63 = phi i32 [ 0, %35 ], [ %160, %60 ]
  %64 = mul nuw nsw i32 %62, %10
  %65 = add nsw i32 %64, %20
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = add nuw i32 %64, %11
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %2, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = fmul contract float %68, %72
  %74 = fadd contract float %61, %73
  store float %74, float addrspace(1)* %28, align 4, !tbaa !7
  %75 = add nuw nsw i32 %62, 1
  %76 = mul nuw nsw i32 %75, %10
  %77 = add nsw i32 %76, %20
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = add nuw i32 %76, %11
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %2, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = fmul contract float %80, %84
  %86 = fadd contract float %74, %85
  store float %86, float addrspace(1)* %28, align 4, !tbaa !7
  %87 = add nuw nsw i32 %62, 2
  %88 = mul nuw nsw i32 %87, %10
  %89 = add nsw i32 %88, %20
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = add nuw i32 %88, %11
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fmul contract float %92, %96
  %98 = fadd contract float %86, %97
  store float %98, float addrspace(1)* %28, align 4, !tbaa !7
  %99 = add nuw nsw i32 %62, 3
  %100 = mul nuw nsw i32 %99, %10
  %101 = add nsw i32 %100, %20
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = add nuw i32 %100, %11
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %2, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = fmul contract float %104, %108
  %110 = fadd contract float %98, %109
  store float %110, float addrspace(1)* %28, align 4, !tbaa !7
  %111 = add nuw nsw i32 %62, 4
  %112 = mul nuw nsw i32 %111, %10
  %113 = add nsw i32 %112, %20
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = add nuw i32 %112, %11
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %2, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = fmul contract float %116, %120
  %122 = fadd contract float %110, %121
  store float %122, float addrspace(1)* %28, align 4, !tbaa !7
  %123 = add nuw nsw i32 %62, 5
  %124 = mul nuw nsw i32 %123, %10
  %125 = add nsw i32 %124, %20
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %129 = add nuw i32 %124, %11
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %2, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = fmul contract float %128, %132
  %134 = fadd contract float %122, %133
  store float %134, float addrspace(1)* %28, align 4, !tbaa !7
  %135 = add nuw nsw i32 %62, 6
  %136 = mul nuw nsw i32 %135, %10
  %137 = add nsw i32 %136, %20
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7
  %141 = add nuw i32 %136, %11
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %2, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7
  %145 = fmul contract float %140, %144
  %146 = fadd contract float %134, %145
  store float %146, float addrspace(1)* %28, align 4, !tbaa !7
  %147 = add nuw nsw i32 %62, 7
  %148 = mul nuw nsw i32 %147, %10
  %149 = add nsw i32 %148, %20
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7
  %153 = add nuw i32 %148, %11
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %2, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %157 = fmul contract float %152, %156
  %158 = fadd contract float %146, %157
  store float %158, float addrspace(1)* %28, align 4, !tbaa !7
  %159 = add nuw nsw i32 %62, 8
  %160 = add i32 %63, 8
  %161 = icmp eq i32 %160, %36
  br i1 %161, label %37, label %60, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
