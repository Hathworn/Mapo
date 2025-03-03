; ModuleID = '../data/hip_kernels/17320/3/main.cu'
source_filename = "../data/hip_kernels/17320/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16median_filter_2dPhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #1 {
  %5 = alloca [121 x float], align 16, addrspace(5)
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %2
  %24 = icmp slt i32 %22, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %180

26:                                               ; preds = %4
  %27 = mul nsw i32 %22, %2
  %28 = bitcast [121 x float] addrspace(5)* %5 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 484, i8 addrspace(5)* %28) #3
  %29 = add nsw i32 %14, -4
  %30 = add nsw i32 %14, 4
  %31 = add nsw i32 %22, -4
  %32 = add nsw i32 %22, 4
  br label %151

33:                                               ; preds = %156
  %34 = add nsw i32 %27, %14
  %35 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 0
  %36 = icmp sgt i32 %177, 1
  br i1 %36, label %37, label %144

37:                                               ; preds = %33
  %38 = add i32 %177, -2
  br label %39

39:                                               ; preds = %71, %37
  %40 = phi i32 [ 0, %37 ], [ %72, %71 ]
  %41 = xor i32 %40, -1
  %42 = add i32 %177, %41
  %43 = xor i32 %40, -1
  %44 = add i32 %177, %43
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %46, label %71

46:                                               ; preds = %39
  %47 = sub i32 %38, %40
  %48 = load float, float addrspace(5)* %35, align 16, !tbaa !7
  %49 = and i32 %42, 7
  %50 = icmp ult i32 %47, 7
  br i1 %50, label %53, label %51

51:                                               ; preds = %46
  %52 = and i32 %42, -8
  br label %74

53:                                               ; preds = %140, %46
  %54 = phi float [ %48, %46 ], [ %141, %140 ]
  %55 = phi i32 [ 0, %46 ], [ %134, %140 ]
  %56 = icmp eq i32 %49, 0
  br i1 %56, label %71, label %57

57:                                               ; preds = %53, %67
  %58 = phi float [ %68, %67 ], [ %54, %53 ]
  %59 = phi i32 [ %61, %67 ], [ %55, %53 ]
  %60 = phi i32 [ %69, %67 ], [ 0, %53 ]
  %61 = add nuw nsw i32 %59, 1
  %62 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %61
  %63 = load float, float addrspace(5)* %62, align 4, !tbaa !7
  %64 = fcmp contract ogt float %58, %63
  br i1 %64, label %65, label %67

65:                                               ; preds = %57
  %66 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %59
  store float %63, float addrspace(5)* %66, align 4, !tbaa !7
  store float %58, float addrspace(5)* %62, align 4, !tbaa !7
  br label %67

67:                                               ; preds = %65, %57
  %68 = phi float [ %63, %57 ], [ %58, %65 ]
  %69 = add i32 %60, 1
  %70 = icmp eq i32 %69, %49
  br i1 %70, label %71, label %57, !llvm.loop !11

71:                                               ; preds = %53, %67, %39
  %72 = add nuw nsw i32 %40, 1
  %73 = icmp eq i32 %38, %40
  br i1 %73, label %144, label %39, !llvm.loop !13

74:                                               ; preds = %140, %51
  %75 = phi float [ %48, %51 ], [ %141, %140 ]
  %76 = phi i32 [ 0, %51 ], [ %134, %140 ]
  %77 = phi i32 [ 0, %51 ], [ %142, %140 ]
  %78 = or i32 %76, 1
  %79 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %78
  %80 = load float, float addrspace(5)* %79, align 4, !tbaa !7
  %81 = fcmp contract ogt float %75, %80
  br i1 %81, label %82, label %84

82:                                               ; preds = %74
  %83 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %76
  store float %80, float addrspace(5)* %83, align 16, !tbaa !7
  store float %75, float addrspace(5)* %79, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %82, %74
  %85 = phi float [ %80, %74 ], [ %75, %82 ]
  %86 = or i32 %76, 2
  %87 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %86
  %88 = load float, float addrspace(5)* %87, align 8, !tbaa !7
  %89 = fcmp contract ogt float %85, %88
  br i1 %89, label %90, label %92

90:                                               ; preds = %84
  %91 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %78
  store float %88, float addrspace(5)* %91, align 4, !tbaa !7
  store float %85, float addrspace(5)* %87, align 8, !tbaa !7
  br label %92

92:                                               ; preds = %90, %84
  %93 = phi float [ %88, %84 ], [ %85, %90 ]
  %94 = or i32 %76, 3
  %95 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %94
  %96 = load float, float addrspace(5)* %95, align 4, !tbaa !7
  %97 = fcmp contract ogt float %93, %96
  br i1 %97, label %98, label %100

98:                                               ; preds = %92
  %99 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %86
  store float %96, float addrspace(5)* %99, align 8, !tbaa !7
  store float %93, float addrspace(5)* %95, align 4, !tbaa !7
  br label %100

100:                                              ; preds = %98, %92
  %101 = phi float [ %96, %92 ], [ %93, %98 ]
  %102 = or i32 %76, 4
  %103 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %102
  %104 = load float, float addrspace(5)* %103, align 16, !tbaa !7
  %105 = fcmp contract ogt float %101, %104
  br i1 %105, label %106, label %108

106:                                              ; preds = %100
  %107 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %94
  store float %104, float addrspace(5)* %107, align 4, !tbaa !7
  store float %101, float addrspace(5)* %103, align 16, !tbaa !7
  br label %108

108:                                              ; preds = %106, %100
  %109 = phi float [ %104, %100 ], [ %101, %106 ]
  %110 = or i32 %76, 5
  %111 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %110
  %112 = load float, float addrspace(5)* %111, align 4, !tbaa !7
  %113 = fcmp contract ogt float %109, %112
  br i1 %113, label %114, label %116

114:                                              ; preds = %108
  %115 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %102
  store float %112, float addrspace(5)* %115, align 16, !tbaa !7
  store float %109, float addrspace(5)* %111, align 4, !tbaa !7
  br label %116

116:                                              ; preds = %114, %108
  %117 = phi float [ %112, %108 ], [ %109, %114 ]
  %118 = or i32 %76, 6
  %119 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %118
  %120 = load float, float addrspace(5)* %119, align 8, !tbaa !7
  %121 = fcmp contract ogt float %117, %120
  br i1 %121, label %122, label %124

122:                                              ; preds = %116
  %123 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %110
  store float %120, float addrspace(5)* %123, align 4, !tbaa !7
  store float %117, float addrspace(5)* %119, align 8, !tbaa !7
  br label %124

124:                                              ; preds = %122, %116
  %125 = phi float [ %120, %116 ], [ %117, %122 ]
  %126 = or i32 %76, 7
  %127 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %126
  %128 = load float, float addrspace(5)* %127, align 4, !tbaa !7
  %129 = fcmp contract ogt float %125, %128
  br i1 %129, label %130, label %132

130:                                              ; preds = %124
  %131 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %118
  store float %128, float addrspace(5)* %131, align 8, !tbaa !7
  store float %125, float addrspace(5)* %127, align 4, !tbaa !7
  br label %132

132:                                              ; preds = %130, %124
  %133 = phi float [ %128, %124 ], [ %125, %130 ]
  %134 = add nuw nsw i32 %76, 8
  %135 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %134
  %136 = load float, float addrspace(5)* %135, align 16, !tbaa !7
  %137 = fcmp contract ogt float %133, %136
  br i1 %137, label %138, label %140

138:                                              ; preds = %132
  %139 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %126
  store float %136, float addrspace(5)* %139, align 4, !tbaa !7
  store float %133, float addrspace(5)* %135, align 16, !tbaa !7
  br label %140

140:                                              ; preds = %138, %132
  %141 = phi float [ %136, %132 ], [ %133, %138 ]
  %142 = add i32 %77, 8
  %143 = icmp eq i32 %142, %52
  br i1 %143, label %53, label %74, !llvm.loop !15

144:                                              ; preds = %71, %33
  %145 = sdiv i32 %177, 2
  %146 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %145
  %147 = load float, float addrspace(5)* %146, align 4, !tbaa !7
  %148 = fptoui float %147 to i8
  %149 = sext i32 %34 to i64
  %150 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %149
  store i8 %148, i8 addrspace(1)* %150, align 1, !tbaa !16
  call void @llvm.lifetime.end.p5i8(i64 484, i8 addrspace(5)* %28) #3
  br label %180

151:                                              ; preds = %26, %156
  %152 = phi i32 [ %29, %26 ], [ %157, %156 ]
  %153 = phi i32 [ 0, %26 ], [ %177, %156 ]
  %154 = icmp sgt i32 %152, -1
  %155 = icmp slt i32 %152, %2
  br label %159

156:                                              ; preds = %176
  %157 = add nsw i32 %152, 1
  %158 = icmp slt i32 %152, %30
  br i1 %158, label %151, label %33, !llvm.loop !17

159:                                              ; preds = %151, %176
  %160 = phi i32 [ %31, %151 ], [ %178, %176 ]
  %161 = phi i32 [ %153, %151 ], [ %177, %176 ]
  br i1 %154, label %162, label %176

162:                                              ; preds = %159
  %163 = icmp sgt i32 %160, -1
  %164 = select i1 %155, i1 %163, i1 false
  %165 = icmp slt i32 %160, %3
  %166 = select i1 %164, i1 %165, i1 false
  br i1 %166, label %167, label %176

167:                                              ; preds = %162
  %168 = mul nsw i32 %160, %2
  %169 = add nsw i32 %168, %152
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %170
  %172 = load i8, i8 addrspace(1)* %171, align 1, !tbaa !16, !amdgpu.noclobber !5
  %173 = uitofp i8 %172 to float
  %174 = add nsw i32 %161, 1
  %175 = getelementptr inbounds [121 x float], [121 x float] addrspace(5)* %5, i32 0, i32 %161
  store float %173, float addrspace(5)* %175, align 4, !tbaa !7
  br label %176

176:                                              ; preds = %159, %162, %167
  %177 = phi i32 [ %174, %167 ], [ %161, %162 ], [ %161, %159 ]
  %178 = add nsw i32 %160, 1
  %179 = icmp slt i32 %160, %32
  br i1 %179, label %159, label %156, !llvm.loop !18

180:                                              ; preds = %144, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

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
!16 = !{!9, !9, i64 0}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
