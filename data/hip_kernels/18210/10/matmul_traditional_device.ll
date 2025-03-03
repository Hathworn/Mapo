; ModuleID = '../data/hip_kernels/18210/10/main.cu'
source_filename = "../data/hip_kernels/18210/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18matmul_traditionalPKfS0_Pfii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = mul nsw i32 %14, %3
  %24 = add nsw i32 %23, %22
  %25 = icmp slt i32 %14, %3
  %26 = icmp slt i32 %22, %4
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %164

28:                                               ; preds = %5
  %29 = icmp sgt i32 %3, 0
  br i1 %29, label %30, label %58

30:                                               ; preds = %28
  %31 = and i32 %3, 7
  %32 = icmp ult i32 %3, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %30
  %34 = and i32 %3, -8
  br label %62

35:                                               ; preds = %62, %30
  %36 = phi float [ undef, %30 ], [ %160, %62 ]
  %37 = phi float [ 0.000000e+00, %30 ], [ %160, %62 ]
  %38 = phi i32 [ 0, %30 ], [ %161, %62 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %58, label %40

40:                                               ; preds = %35, %40
  %41 = phi float [ %54, %40 ], [ %37, %35 ]
  %42 = phi i32 [ %55, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %56, %40 ], [ 0, %35 ]
  %44 = add nsw i32 %42, %23
  %45 = mul nsw i32 %42, %3
  %46 = add nsw i32 %45, %22
  %47 = sext i32 %44 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = sext i32 %46 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fmul contract float %49, %52
  %54 = fadd contract float %41, %53
  %55 = add nuw nsw i32 %42, 1
  %56 = add i32 %43, 1
  %57 = icmp eq i32 %56, %31
  br i1 %57, label %58, label %40, !llvm.loop !11

58:                                               ; preds = %35, %40, %28
  %59 = phi float [ 0.000000e+00, %28 ], [ %36, %35 ], [ %54, %40 ]
  %60 = sext i32 %24 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  store float %59, float addrspace(1)* %61, align 4, !tbaa !7
  br label %164

62:                                               ; preds = %62, %33
  %63 = phi float [ 0.000000e+00, %33 ], [ %160, %62 ]
  %64 = phi i32 [ 0, %33 ], [ %161, %62 ]
  %65 = phi i32 [ 0, %33 ], [ %162, %62 ]
  %66 = add nsw i32 %64, %23
  %67 = mul nsw i32 %64, %3
  %68 = add nsw i32 %67, %22
  %69 = sext i32 %66 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = sext i32 %68 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = fmul contract float %71, %74
  %76 = fadd contract float %63, %75
  %77 = or i32 %64, 1
  %78 = add nsw i32 %77, %23
  %79 = mul nsw i32 %77, %3
  %80 = add nsw i32 %79, %22
  %81 = sext i32 %78 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = sext i32 %80 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = fmul contract float %83, %86
  %88 = fadd contract float %76, %87
  %89 = or i32 %64, 2
  %90 = add nsw i32 %89, %23
  %91 = mul nsw i32 %89, %3
  %92 = add nsw i32 %91, %22
  %93 = sext i32 %90 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = sext i32 %92 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = fmul contract float %95, %98
  %100 = fadd contract float %88, %99
  %101 = or i32 %64, 3
  %102 = add nsw i32 %101, %23
  %103 = mul nsw i32 %101, %3
  %104 = add nsw i32 %103, %22
  %105 = sext i32 %102 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = sext i32 %104 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = fmul contract float %107, %110
  %112 = fadd contract float %100, %111
  %113 = or i32 %64, 4
  %114 = add nsw i32 %113, %23
  %115 = mul nsw i32 %113, %3
  %116 = add nsw i32 %115, %22
  %117 = sext i32 %114 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = sext i32 %116 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = fmul contract float %119, %122
  %124 = fadd contract float %112, %123
  %125 = or i32 %64, 5
  %126 = add nsw i32 %125, %23
  %127 = mul nsw i32 %125, %3
  %128 = add nsw i32 %127, %22
  %129 = sext i32 %126 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !5
  %132 = sext i32 %128 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !5
  %135 = fmul contract float %131, %134
  %136 = fadd contract float %124, %135
  %137 = or i32 %64, 6
  %138 = add nsw i32 %137, %23
  %139 = mul nsw i32 %137, %3
  %140 = add nsw i32 %139, %22
  %141 = sext i32 %138 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !5
  %144 = sext i32 %140 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !5
  %147 = fmul contract float %143, %146
  %148 = fadd contract float %136, %147
  %149 = or i32 %64, 7
  %150 = add nsw i32 %149, %23
  %151 = mul nsw i32 %149, %3
  %152 = add nsw i32 %151, %22
  %153 = sext i32 %150 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = sext i32 %152 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %1, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !5
  %159 = fmul contract float %155, %158
  %160 = fadd contract float %148, %159
  %161 = add nuw nsw i32 %64, 8
  %162 = add i32 %65, 8
  %163 = icmp eq i32 %162, %34
  br i1 %163, label %35, label %62, !llvm.loop !13

164:                                              ; preds = %58, %5
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
