; ModuleID = '../data/hip_kernels/15492/3/main.cu'
source_filename = "../data/hip_kernels/15492/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16tensor_4d_equalsiiiiPKfiiiiiS0_iiiiiPi(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, float addrspace(1)* nocapture readonly %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 addrspace(1)* nocapture %16) local_unnamed_addr #0 {
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %18, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %26 = add i32 %24, %25
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %28 = getelementptr i8, i8 addrspace(4)* %19, i64 6
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 2, !range !4, !invariant.load !5
  %31 = zext i16 %30 to i32
  %32 = mul i32 %27, %31
  %33 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %34 = add i32 %32, %33
  %35 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %36 = getelementptr i8, i8 addrspace(4)* %19, i64 8
  %37 = bitcast i8 addrspace(4)* %36 to i16 addrspace(4)*
  %38 = load i16, i16 addrspace(4)* %37, align 4, !range !4, !invariant.load !5
  %39 = zext i16 %38 to i32
  %40 = mul i32 %35, %39
  %41 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %42 = add i32 %40, %41
  %43 = icmp slt i32 %26, %0
  %44 = icmp slt i32 %34, %1
  %45 = select i1 %43, i1 %44, i1 false
  %46 = icmp slt i32 %42, %2
  %47 = select i1 %45, i1 %46, i1 false
  br i1 %47, label %48, label %160

48:                                               ; preds = %17
  %49 = mul nsw i32 %26, %6
  %50 = add nsw i32 %49, %5
  %51 = mul nsw i32 %34, %7
  %52 = add nsw i32 %50, %51
  %53 = mul nsw i32 %42, %8
  %54 = add nsw i32 %52, %53
  %55 = mul nsw i32 %26, %12
  %56 = add nsw i32 %55, %11
  %57 = mul nsw i32 %34, %13
  %58 = add nsw i32 %56, %57
  %59 = mul nsw i32 %42, %14
  %60 = add nsw i32 %58, %59
  %61 = icmp sgt i32 %3, 0
  br i1 %61, label %62, label %160

62:                                               ; preds = %48
  %63 = and i32 %3, 3
  %64 = icmp ult i32 %3, 4
  br i1 %64, label %136, label %65

65:                                               ; preds = %62
  %66 = and i32 %3, -4
  br label %67

67:                                               ; preds = %132, %65
  %68 = phi i32 [ 0, %65 ], [ %133, %132 ]
  %69 = phi i32 [ 0, %65 ], [ %134, %132 ]
  %70 = mul nsw i32 %68, %9
  %71 = add nsw i32 %54, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %4, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = mul nsw i32 %68, %15
  %76 = add nsw i32 %60, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %10, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = fcmp contract une float %74, %79
  br i1 %80, label %81, label %84

81:                                               ; preds = %67
  %82 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !11
  %83 = add nsw i32 %82, 1
  store i32 %83, i32 addrspace(1)* %16, align 4, !tbaa !11
  br label %84

84:                                               ; preds = %67, %81
  %85 = or i32 %68, 1
  %86 = mul nsw i32 %85, %9
  %87 = add nsw i32 %54, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %4, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = mul nsw i32 %85, %15
  %92 = add nsw i32 %60, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %10, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = fcmp contract une float %90, %95
  br i1 %96, label %97, label %100

97:                                               ; preds = %84
  %98 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !11
  %99 = add nsw i32 %98, 1
  store i32 %99, i32 addrspace(1)* %16, align 4, !tbaa !11
  br label %100

100:                                              ; preds = %97, %84
  %101 = or i32 %68, 2
  %102 = mul nsw i32 %101, %9
  %103 = add nsw i32 %54, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %4, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = mul nsw i32 %101, %15
  %108 = add nsw i32 %60, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %10, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = fcmp contract une float %106, %111
  br i1 %112, label %113, label %116

113:                                              ; preds = %100
  %114 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !11
  %115 = add nsw i32 %114, 1
  store i32 %115, i32 addrspace(1)* %16, align 4, !tbaa !11
  br label %116

116:                                              ; preds = %113, %100
  %117 = or i32 %68, 3
  %118 = mul nsw i32 %117, %9
  %119 = add nsw i32 %54, %118
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %4, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = mul nsw i32 %117, %15
  %124 = add nsw i32 %60, %123
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %10, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = fcmp contract une float %122, %127
  br i1 %128, label %129, label %132

129:                                              ; preds = %116
  %130 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !11
  %131 = add nsw i32 %130, 1
  store i32 %131, i32 addrspace(1)* %16, align 4, !tbaa !11
  br label %132

132:                                              ; preds = %129, %116
  %133 = add nuw nsw i32 %68, 4
  %134 = add i32 %69, 4
  %135 = icmp eq i32 %134, %66
  br i1 %135, label %136, label %67, !llvm.loop !13

136:                                              ; preds = %132, %62
  %137 = phi i32 [ 0, %62 ], [ %133, %132 ]
  %138 = icmp eq i32 %63, 0
  br i1 %138, label %160, label %139

139:                                              ; preds = %136, %156
  %140 = phi i32 [ %157, %156 ], [ %137, %136 ]
  %141 = phi i32 [ %158, %156 ], [ 0, %136 ]
  %142 = mul nsw i32 %140, %9
  %143 = add nsw i32 %54, %142
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %4, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !5
  %147 = mul nsw i32 %140, %15
  %148 = add nsw i32 %60, %147
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %10, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !5
  %152 = fcmp contract une float %146, %151
  br i1 %152, label %153, label %156

153:                                              ; preds = %139
  %154 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !11
  %155 = add nsw i32 %154, 1
  store i32 %155, i32 addrspace(1)* %16, align 4, !tbaa !11
  br label %156

156:                                              ; preds = %153, %139
  %157 = add nuw nsw i32 %140, 1
  %158 = add i32 %141, 1
  %159 = icmp eq i32 %158, %63
  br i1 %159, label %160, label %139, !llvm.loop !15

160:                                              ; preds = %136, %156, %48, %17
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
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
