; ModuleID = '../data/hip_kernels/1769/2/main.cu'
source_filename = "../data/hip_kernels/1769/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17wlcss_cuda_kernelPiS_S_S_S_S_S_S_S_S_S_(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture %9, i32 addrspace(1)* nocapture readonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5, !amdgpu.noclobber !9
  %17 = sext i32 %13 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5, !amdgpu.noclobber !9
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %14
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %17
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !5, !amdgpu.noclobber !9
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr i8, i8 addrspace(4)* %24, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !10, !invariant.load !9
  %28 = zext i16 %27 to i32
  %29 = mul i32 %13, %28
  %30 = add i32 %29, %12
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %31
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %36
  %38 = sext i32 %33 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = sext i32 %21 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %40
  %42 = sext i32 %23 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %42
  %44 = mul nuw nsw i32 %12, 3
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  %48 = add nuw nsw i32 %44, 1
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = add nuw nsw i32 %44, 2
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %56 = icmp sgt i32 %19, 0
  br i1 %56, label %57, label %76

57:                                               ; preds = %11
  %58 = icmp sgt i32 %16, 0
  %59 = add nsw i32 %16, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %60
  %62 = sext i32 %16 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %62
  %64 = and i32 %16, 1
  %65 = icmp eq i32 %16, 1
  %66 = and i32 %16, -2
  %67 = icmp eq i32 %64, 0
  br label %68

68:                                               ; preds = %57, %109
  %69 = phi i32 [ 0, %57 ], [ %113, %109 ]
  br i1 %58, label %73, label %70

70:                                               ; preds = %68
  %71 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5
  %72 = zext i32 %69 to i64
  br label %109

73:                                               ; preds = %68
  %74 = zext i32 %69 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %43, i64 %74
  br i1 %65, label %77, label %115

76:                                               ; preds = %109, %11
  ret void

77:                                               ; preds = %170, %73
  %78 = phi i32 [ undef, %73 ], [ %172, %170 ]
  %79 = phi i32 [ 0, %73 ], [ %155, %170 ]
  br i1 %67, label %109, label %80

80:                                               ; preds = %77
  %81 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !5
  %82 = zext i32 %79 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %41, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !5
  %85 = sub nsw i32 %81, %84
  %86 = tail call i32 @llvm.abs.i32(i32 %85, i1 true)
  %87 = icmp sgt i32 %86, %55
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %82
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !5
  br i1 %87, label %93, label %90

90:                                               ; preds = %80
  %91 = add nsw i32 %89, %47
  %92 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5
  br label %105

93:                                               ; preds = %80
  %94 = add nuw nsw i32 %79, 1
  %95 = mul nsw i32 %86, %51
  %96 = sub nsw i32 %89, %95
  %97 = zext i32 %94 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !5
  %100 = sub nsw i32 %99, %95
  %101 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5
  %102 = sub nsw i32 %101, %95
  %103 = tail call i32 @llvm.smax.i32(i32 %100, i32 %102)
  %104 = tail call i32 @llvm.smax.i32(i32 %96, i32 %103)
  br label %105

105:                                              ; preds = %93, %90
  %106 = phi i32 [ %101, %93 ], [ %92, %90 ]
  %107 = phi i32 [ %104, %93 ], [ %91, %90 ]
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %82
  store i32 %106, i32 addrspace(1)* %108, align 4, !tbaa !5
  store i32 %107, i32 addrspace(1)* %61, align 4, !tbaa !5
  br label %109

109:                                              ; preds = %105, %77, %70
  %110 = phi i64 [ %72, %70 ], [ %74, %77 ], [ %74, %105 ]
  %111 = phi i32 [ %71, %70 ], [ %78, %77 ], [ %107, %105 ]
  store i32 %111, i32 addrspace(1)* %63, align 4, !tbaa !5
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %110
  store i32 %111, i32 addrspace(1)* %112, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %61, align 4, !tbaa !5
  %113 = add nuw nsw i32 %69, 1
  %114 = icmp eq i32 %113, %19
  br i1 %114, label %76, label %68, !llvm.loop !11

115:                                              ; preds = %73, %170
  %116 = phi i32 [ %155, %170 ], [ 0, %73 ]
  %117 = phi i32 [ %174, %170 ], [ 0, %73 ]
  %118 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !5
  %119 = zext i32 %116 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %41, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !5
  %122 = sub nsw i32 %118, %121
  %123 = tail call i32 @llvm.abs.i32(i32 %122, i1 true)
  %124 = icmp sgt i32 %123, %55
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %119
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !5
  %127 = or i32 %116, 1
  br i1 %124, label %131, label %128

128:                                              ; preds = %115
  %129 = add nsw i32 %126, %47
  %130 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5
  br label %142

131:                                              ; preds = %115
  %132 = mul nsw i32 %123, %51
  %133 = sub nsw i32 %126, %132
  %134 = zext i32 %127 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %134
  %136 = load i32, i32 addrspace(1)* %135, align 4, !tbaa !5
  %137 = sub nsw i32 %136, %132
  %138 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5
  %139 = sub nsw i32 %138, %132
  %140 = tail call i32 @llvm.smax.i32(i32 %137, i32 %139)
  %141 = tail call i32 @llvm.smax.i32(i32 %133, i32 %140)
  br label %142

142:                                              ; preds = %131, %128
  %143 = phi i32 [ %138, %131 ], [ %130, %128 ]
  %144 = phi i32 [ %141, %131 ], [ %129, %128 ]
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %119
  store i32 %143, i32 addrspace(1)* %145, align 4, !tbaa !5
  store i32 %144, i32 addrspace(1)* %61, align 4, !tbaa !5
  %146 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !5
  %147 = zext i32 %127 to i64
  %148 = getelementptr inbounds i32, i32 addrspace(1)* %41, i64 %147
  %149 = load i32, i32 addrspace(1)* %148, align 4, !tbaa !5
  %150 = sub nsw i32 %146, %149
  %151 = tail call i32 @llvm.abs.i32(i32 %150, i1 true)
  %152 = icmp sgt i32 %151, %55
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %147
  %154 = load i32, i32 addrspace(1)* %153, align 4, !tbaa !5
  %155 = add nuw nsw i32 %116, 2
  br i1 %152, label %159, label %156

156:                                              ; preds = %142
  %157 = add nsw i32 %154, %47
  %158 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5
  br label %170

159:                                              ; preds = %142
  %160 = mul nsw i32 %151, %51
  %161 = sub nsw i32 %154, %160
  %162 = zext i32 %155 to i64
  %163 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %162
  %164 = load i32, i32 addrspace(1)* %163, align 4, !tbaa !5
  %165 = sub nsw i32 %164, %160
  %166 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5
  %167 = sub nsw i32 %166, %160
  %168 = tail call i32 @llvm.smax.i32(i32 %165, i32 %167)
  %169 = tail call i32 @llvm.smax.i32(i32 %161, i32 %168)
  br label %170

170:                                              ; preds = %159, %156
  %171 = phi i32 [ %166, %159 ], [ %158, %156 ]
  %172 = phi i32 [ %169, %159 ], [ %157, %156 ]
  %173 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %147
  store i32 %171, i32 addrspace(1)* %173, align 4, !tbaa !5
  store i32 %172, i32 addrspace(1)* %61, align 4, !tbaa !5
  %174 = add i32 %117, 2
  %175 = icmp eq i32 %174, %66
  br i1 %175, label %77, label %115, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

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
