; ModuleID = '../data/hip_kernels/1769/3/main.cu'
source_filename = "../data/hip_kernels/1769/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17wlcss_cuda_kernelPiS_S_S_S_S_S_S_S_S_S_S_(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture %9, i32 addrspace(1)* nocapture readonly %10, i32 addrspace(1)* nocapture readonly %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = zext i32 %13 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !5, !amdgpu.noclobber !9
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %15
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %18
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !10, !invariant.load !9
  %29 = zext i16 %28 to i32
  %30 = mul i32 %14, %29
  %31 = add i32 %30, %13
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %32
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %37
  %39 = sext i32 %34 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = sext i32 %22 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %41
  %43 = sext i32 %24 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %43
  %45 = mul nuw nsw i32 %13, 3
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  %49 = add nuw nsw i32 %45, 1
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = add nuw nsw i32 %45, 2
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = icmp sgt i32 %20, 0
  br i1 %57, label %58, label %77

58:                                               ; preds = %12
  %59 = icmp sgt i32 %17, 0
  %60 = add nsw i32 %17, 1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %61
  %63 = sext i32 %17 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %63
  %65 = and i32 %17, 1
  %66 = icmp eq i32 %17, 1
  %67 = and i32 %17, -2
  %68 = icmp eq i32 %65, 0
  br label %69

69:                                               ; preds = %58, %113
  %70 = phi i32 [ 0, %58 ], [ %117, %113 ]
  br i1 %59, label %74, label %71

71:                                               ; preds = %69
  %72 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5
  %73 = zext i32 %70 to i64
  br label %113

74:                                               ; preds = %69
  %75 = zext i32 %70 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %44, i64 %75
  br i1 %66, label %78, label %119

77:                                               ; preds = %113, %12
  ret void

78:                                               ; preds = %180, %74
  %79 = phi i32 [ undef, %74 ], [ %182, %180 ]
  %80 = phi i32 [ 0, %74 ], [ %165, %180 ]
  br i1 %68, label %113, label %81

81:                                               ; preds = %78
  %82 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !5
  %83 = mul nsw i32 %82, 26
  %84 = zext i32 %80 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %42, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !5
  %87 = add nsw i32 %83, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !5
  %91 = icmp sgt i32 %90, %56
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %84
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !5
  br i1 %91, label %97, label %94

94:                                               ; preds = %81
  %95 = add nsw i32 %93, %48
  %96 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5
  br label %109

97:                                               ; preds = %81
  %98 = add nuw nsw i32 %80, 1
  %99 = mul nsw i32 %90, %52
  %100 = sub nsw i32 %93, %99
  %101 = zext i32 %98 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !5
  %104 = sub nsw i32 %103, %99
  %105 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5
  %106 = sub nsw i32 %105, %99
  %107 = tail call i32 @llvm.smax.i32(i32 %104, i32 %106)
  %108 = tail call i32 @llvm.smax.i32(i32 %100, i32 %107)
  br label %109

109:                                              ; preds = %97, %94
  %110 = phi i32 [ %105, %97 ], [ %96, %94 ]
  %111 = phi i32 [ %108, %97 ], [ %95, %94 ]
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %84
  store i32 %110, i32 addrspace(1)* %112, align 4, !tbaa !5
  store i32 %111, i32 addrspace(1)* %62, align 4, !tbaa !5
  br label %113

113:                                              ; preds = %109, %78, %71
  %114 = phi i64 [ %73, %71 ], [ %75, %78 ], [ %75, %109 ]
  %115 = phi i32 [ %72, %71 ], [ %79, %78 ], [ %111, %109 ]
  store i32 %115, i32 addrspace(1)* %64, align 4, !tbaa !5
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %40, i64 %114
  store i32 %115, i32 addrspace(1)* %116, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %62, align 4, !tbaa !5
  %117 = add nuw nsw i32 %70, 1
  %118 = icmp eq i32 %117, %20
  br i1 %118, label %77, label %69, !llvm.loop !11

119:                                              ; preds = %74, %180
  %120 = phi i32 [ %165, %180 ], [ 0, %74 ]
  %121 = phi i32 [ %184, %180 ], [ 0, %74 ]
  %122 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !5
  %123 = mul nsw i32 %122, 26
  %124 = zext i32 %120 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %42, i64 %124
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !5
  %127 = add nsw i32 %123, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !5
  %131 = icmp sgt i32 %130, %56
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %124
  %133 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !5
  %134 = or i32 %120, 1
  br i1 %131, label %138, label %135

135:                                              ; preds = %119
  %136 = add nsw i32 %133, %48
  %137 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5
  br label %149

138:                                              ; preds = %119
  %139 = mul nsw i32 %130, %52
  %140 = sub nsw i32 %133, %139
  %141 = zext i32 %134 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %141
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !5
  %144 = sub nsw i32 %143, %139
  %145 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5
  %146 = sub nsw i32 %145, %139
  %147 = tail call i32 @llvm.smax.i32(i32 %144, i32 %146)
  %148 = tail call i32 @llvm.smax.i32(i32 %140, i32 %147)
  br label %149

149:                                              ; preds = %138, %135
  %150 = phi i32 [ %145, %138 ], [ %137, %135 ]
  %151 = phi i32 [ %148, %138 ], [ %136, %135 ]
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %124
  store i32 %150, i32 addrspace(1)* %152, align 4, !tbaa !5
  store i32 %151, i32 addrspace(1)* %62, align 4, !tbaa !5
  %153 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !5
  %154 = mul nsw i32 %153, 26
  %155 = zext i32 %134 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %42, i64 %155
  %157 = load i32, i32 addrspace(1)* %156, align 4, !tbaa !5
  %158 = add nsw i32 %154, %157
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %159
  %161 = load i32, i32 addrspace(1)* %160, align 4, !tbaa !5
  %162 = icmp sgt i32 %161, %56
  %163 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %155
  %164 = load i32, i32 addrspace(1)* %163, align 4, !tbaa !5
  %165 = add nuw nsw i32 %120, 2
  br i1 %162, label %169, label %166

166:                                              ; preds = %149
  %167 = add nsw i32 %164, %48
  %168 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5
  br label %180

169:                                              ; preds = %149
  %170 = mul nsw i32 %161, %52
  %171 = sub nsw i32 %164, %170
  %172 = zext i32 %165 to i64
  %173 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %172
  %174 = load i32, i32 addrspace(1)* %173, align 4, !tbaa !5
  %175 = sub nsw i32 %174, %170
  %176 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5
  %177 = sub nsw i32 %176, %170
  %178 = tail call i32 @llvm.smax.i32(i32 %175, i32 %177)
  %179 = tail call i32 @llvm.smax.i32(i32 %171, i32 %178)
  br label %180

180:                                              ; preds = %169, %166
  %181 = phi i32 [ %176, %169 ], [ %168, %166 ]
  %182 = phi i32 [ %179, %169 ], [ %167, %166 ]
  %183 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %155
  store i32 %181, i32 addrspace(1)* %183, align 4, !tbaa !5
  store i32 %182, i32 addrspace(1)* %62, align 4, !tbaa !5
  %184 = add i32 %121, 2
  %185 = icmp eq i32 %184, %67
  br i1 %185, label %78, label %119, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
