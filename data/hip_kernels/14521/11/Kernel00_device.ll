; ModuleID = '../data/hip_kernels/14521/11/main.cu'
source_filename = "../data/hip_kernels/14521/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8Kernel00iiiPfS_S_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp sgt i32 %2, 0
  br i1 %24, label %25, label %54

25:                                               ; preds = %6
  %26 = mul nsw i32 %15, %2
  %27 = and i32 %2, 7
  %28 = icmp ult i32 %2, 8
  br i1 %28, label %31, label %29

29:                                               ; preds = %25
  %30 = and i32 %2, -8
  br label %60

31:                                               ; preds = %60, %25
  %32 = phi float [ undef, %25 ], [ %158, %60 ]
  %33 = phi i32 [ 0, %25 ], [ %159, %60 ]
  %34 = phi float [ 0.000000e+00, %25 ], [ %158, %60 ]
  %35 = icmp eq i32 %27, 0
  br i1 %35, label %54, label %36

36:                                               ; preds = %31, %36
  %37 = phi i32 [ %51, %36 ], [ %33, %31 ]
  %38 = phi float [ %50, %36 ], [ %34, %31 ]
  %39 = phi i32 [ %52, %36 ], [ 0, %31 ]
  %40 = add nsw i32 %37, %26
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = mul nsw i32 %37, %0
  %45 = add nsw i32 %44, %23
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = fmul contract float %43, %48
  %50 = fadd contract float %38, %49
  %51 = add nuw nsw i32 %37, 1
  %52 = add i32 %39, 1
  %53 = icmp eq i32 %52, %27
  br i1 %53, label %54, label %36, !llvm.loop !11

54:                                               ; preds = %31, %36, %6
  %55 = phi float [ 0.000000e+00, %6 ], [ %32, %31 ], [ %50, %36 ]
  %56 = mul nsw i32 %15, %0
  %57 = add nsw i32 %56, %23
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %5, i64 %58
  store float %55, float addrspace(1)* %59, align 4, !tbaa !7
  ret void

60:                                               ; preds = %60, %29
  %61 = phi i32 [ 0, %29 ], [ %159, %60 ]
  %62 = phi float [ 0.000000e+00, %29 ], [ %158, %60 ]
  %63 = phi i32 [ 0, %29 ], [ %160, %60 ]
  %64 = add nsw i32 %61, %26
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %3, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = mul nsw i32 %61, %0
  %69 = add nsw i32 %68, %23
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %4, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = fmul contract float %67, %72
  %74 = fadd contract float %62, %73
  %75 = or i32 %61, 1
  %76 = add nsw i32 %75, %26
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = mul nsw i32 %75, %0
  %81 = add nsw i32 %80, %23
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %4, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = fmul contract float %79, %84
  %86 = fadd contract float %74, %85
  %87 = or i32 %61, 2
  %88 = add nsw i32 %87, %26
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %3, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = mul nsw i32 %87, %0
  %93 = add nsw i32 %92, %23
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %4, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = fmul contract float %91, %96
  %98 = fadd contract float %86, %97
  %99 = or i32 %61, 3
  %100 = add nsw i32 %99, %26
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %3, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = mul nsw i32 %99, %0
  %105 = add nsw i32 %104, %23
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %4, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = fmul contract float %103, %108
  %110 = fadd contract float %98, %109
  %111 = or i32 %61, 4
  %112 = add nsw i32 %111, %26
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %3, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = mul nsw i32 %111, %0
  %117 = add nsw i32 %116, %23
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %4, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7, !amdgpu.noclobber !5
  %121 = fmul contract float %115, %120
  %122 = fadd contract float %110, %121
  %123 = or i32 %61, 5
  %124 = add nsw i32 %123, %26
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %3, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = mul nsw i32 %123, %0
  %129 = add nsw i32 %128, %23
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %4, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = fmul contract float %127, %132
  %134 = fadd contract float %122, %133
  %135 = or i32 %61, 6
  %136 = add nsw i32 %135, %26
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %3, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7, !amdgpu.noclobber !5
  %140 = mul nsw i32 %135, %0
  %141 = add nsw i32 %140, %23
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %4, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = fmul contract float %139, %144
  %146 = fadd contract float %134, %145
  %147 = or i32 %61, 7
  %148 = add nsw i32 %147, %26
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %3, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !5
  %152 = mul nsw i32 %147, %0
  %153 = add nsw i32 %152, %23
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %4, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !5
  %157 = fmul contract float %151, %156
  %158 = fadd contract float %146, %157
  %159 = add nuw nsw i32 %61, 8
  %160 = add i32 %63, 8
  %161 = icmp eq i32 %160, %30
  br i1 %161, label %31, label %60, !llvm.loop !13
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
