; ModuleID = '../data/hip_kernels/15492/4/main.cu'
source_filename = "../data/hip_kernels/15492/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16tensor_5d_equalsiiiiiPKfiiiiiiS0_iiiiiiPi(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, float addrspace(1)* nocapture readonly %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, i32 addrspace(1)* nocapture %19) local_unnamed_addr #0 {
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %21, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %29 = add i32 %27, %28
  %30 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %31 = getelementptr i8, i8 addrspace(4)* %22, i64 6
  %32 = bitcast i8 addrspace(4)* %31 to i16 addrspace(4)*
  %33 = load i16, i16 addrspace(4)* %32, align 2, !range !4, !invariant.load !5
  %34 = zext i16 %33 to i32
  %35 = mul i32 %30, %34
  %36 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %37 = add i32 %35, %36
  %38 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %39 = getelementptr i8, i8 addrspace(4)* %22, i64 8
  %40 = bitcast i8 addrspace(4)* %39 to i16 addrspace(4)*
  %41 = load i16, i16 addrspace(4)* %40, align 4, !range !4, !invariant.load !5
  %42 = zext i16 %41 to i32
  %43 = mul i32 %38, %42
  %44 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %45 = add i32 %43, %44
  %46 = icmp slt i32 %29, %0
  %47 = icmp slt i32 %37, %1
  %48 = select i1 %46, i1 %47, i1 false
  %49 = icmp slt i32 %45, %2
  %50 = select i1 %48, i1 %49, i1 false
  br i1 %50, label %51, label %173

51:                                               ; preds = %20
  %52 = mul nsw i32 %29, %7
  %53 = add nsw i32 %52, %6
  %54 = mul nsw i32 %37, %8
  %55 = add nsw i32 %53, %54
  %56 = mul nsw i32 %45, %9
  %57 = add nsw i32 %55, %56
  %58 = mul nsw i32 %29, %14
  %59 = add nsw i32 %58, %13
  %60 = mul nsw i32 %37, %15
  %61 = add nsw i32 %59, %60
  %62 = mul nsw i32 %45, %16
  %63 = add nsw i32 %61, %62
  %64 = icmp sgt i32 %3, 0
  br i1 %64, label %65, label %173

65:                                               ; preds = %51
  %66 = icmp sgt i32 %4, 0
  %67 = and i32 %4, 3
  %68 = icmp ult i32 %4, 4
  %69 = and i32 %4, -4
  %70 = icmp eq i32 %67, 0
  br label %71

71:                                               ; preds = %65, %101
  %72 = phi i32 [ 0, %65 ], [ %102, %101 ]
  br i1 %66, label %73, label %101

73:                                               ; preds = %71
  %74 = mul nsw i32 %72, %10
  %75 = add nsw i32 %57, %74
  %76 = mul nsw i32 %72, %17
  %77 = add nsw i32 %63, %76
  br i1 %68, label %78, label %104

78:                                               ; preds = %169, %73
  %79 = phi i32 [ 0, %73 ], [ %170, %169 ]
  br i1 %70, label %101, label %80

80:                                               ; preds = %78, %97
  %81 = phi i32 [ %98, %97 ], [ %79, %78 ]
  %82 = phi i32 [ %99, %97 ], [ 0, %78 ]
  %83 = mul nsw i32 %81, %11
  %84 = add nsw i32 %75, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %5, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = mul nsw i32 %81, %18
  %89 = add nsw i32 %77, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %12, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = fcmp contract une float %87, %92
  br i1 %93, label %94, label %97

94:                                               ; preds = %80
  %95 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !11
  %96 = add nsw i32 %95, 1
  store i32 %96, i32 addrspace(1)* %19, align 4, !tbaa !11
  br label %97

97:                                               ; preds = %94, %80
  %98 = add nuw nsw i32 %81, 1
  %99 = add i32 %82, 1
  %100 = icmp eq i32 %99, %67
  br i1 %100, label %101, label %80, !llvm.loop !13

101:                                              ; preds = %78, %97, %71
  %102 = add nuw nsw i32 %72, 1
  %103 = icmp eq i32 %102, %3
  br i1 %103, label %173, label %71, !llvm.loop !15

104:                                              ; preds = %73, %169
  %105 = phi i32 [ %170, %169 ], [ 0, %73 ]
  %106 = phi i32 [ %171, %169 ], [ 0, %73 ]
  %107 = mul nsw i32 %105, %11
  %108 = add nsw i32 %75, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %5, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = mul nsw i32 %105, %18
  %113 = add nsw i32 %77, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %12, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = fcmp contract une float %111, %116
  br i1 %117, label %118, label %121

118:                                              ; preds = %104
  %119 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !11
  %120 = add nsw i32 %119, 1
  store i32 %120, i32 addrspace(1)* %19, align 4, !tbaa !11
  br label %121

121:                                              ; preds = %104, %118
  %122 = or i32 %105, 1
  %123 = mul nsw i32 %122, %11
  %124 = add nsw i32 %75, %123
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %5, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = mul nsw i32 %122, %18
  %129 = add nsw i32 %77, %128
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %12, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = fcmp contract une float %127, %132
  br i1 %133, label %134, label %137

134:                                              ; preds = %121
  %135 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !11
  %136 = add nsw i32 %135, 1
  store i32 %136, i32 addrspace(1)* %19, align 4, !tbaa !11
  br label %137

137:                                              ; preds = %134, %121
  %138 = or i32 %105, 2
  %139 = mul nsw i32 %138, %11
  %140 = add nsw i32 %75, %139
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %5, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !5
  %144 = mul nsw i32 %138, %18
  %145 = add nsw i32 %77, %144
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %12, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = fcmp contract une float %143, %148
  br i1 %149, label %150, label %153

150:                                              ; preds = %137
  %151 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !11
  %152 = add nsw i32 %151, 1
  store i32 %152, i32 addrspace(1)* %19, align 4, !tbaa !11
  br label %153

153:                                              ; preds = %150, %137
  %154 = or i32 %105, 3
  %155 = mul nsw i32 %154, %11
  %156 = add nsw i32 %75, %155
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %5, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7, !amdgpu.noclobber !5
  %160 = mul nsw i32 %154, %18
  %161 = add nsw i32 %77, %160
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %12, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7, !amdgpu.noclobber !5
  %165 = fcmp contract une float %159, %164
  br i1 %165, label %166, label %169

166:                                              ; preds = %153
  %167 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !11
  %168 = add nsw i32 %167, 1
  store i32 %168, i32 addrspace(1)* %19, align 4, !tbaa !11
  br label %169

169:                                              ; preds = %166, %153
  %170 = add nuw nsw i32 %105, 4
  %171 = add i32 %106, 4
  %172 = icmp eq i32 %171, %69
  br i1 %172, label %78, label %104, !llvm.loop !17

173:                                              ; preds = %101, %51, %20
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
