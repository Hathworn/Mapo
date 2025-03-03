; ModuleID = '../data/hip_kernels/618/2/main.cu'
source_filename = "../data/hip_kernels/618/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque
%struct.texture.0 = type { %struct.textureReference }

@texInImage = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
@texIntegralImage = protected local_unnamed_addr addrspace(1) externally_initialized global %struct.texture.0 undef, align 8
@keypointsCount = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture addrspace(1)* @texInImage to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27kernel_scanNaiveSumVerticalPjPhii(i32 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readnone %1, i32 %2, i32 %3) local_unnamed_addr #1 {
  %5 = alloca [1024 x i32], align 16, addrspace(5)
  %6 = bitcast [1024 x i32] addrspace(5)* %5 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4096, i8 addrspace(5)* %6) #4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = icmp sgt i32 %2, 0
  br i1 %8, label %9, label %32

9:                                                ; preds = %4
  %10 = load <4 x i32>*, <4 x i32>* addrspace(1)* bitcast (%struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture, %struct.texture addrspace(1)* @texInImage, i64 0, i32 0, i32 11) to <4 x i32>* addrspace(1)*), align 8
  %11 = mul nsw i32 %7, %2
  %12 = addrspacecast <4 x i32>* %10 to <4 x i32> addrspace(4)*
  %13 = load <4 x i32>, <4 x i32> addrspace(4)* %12, align 16, !tbaa !5
  %14 = and i32 %2, 7
  %15 = icmp ult i32 %2, 8
  br i1 %15, label %18, label %16

16:                                               ; preds = %9
  %17 = and i32 %2, -8
  br label %43

18:                                               ; preds = %43, %9
  %19 = phi i32 [ 0, %9 ], [ %93, %43 ]
  %20 = icmp eq i32 %14, 0
  br i1 %20, label %32, label %21

21:                                               ; preds = %18, %21
  %22 = phi i32 [ %29, %21 ], [ %19, %18 ]
  %23 = phi i32 [ %30, %21 ], [ 0, %18 ]
  %24 = add nsw i32 %22, %11
  %25 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %13, i32 %24, i32 0, i32 0, i32 0)
  %26 = bitcast float %25 to i32
  %27 = and i32 %26, 255
  %28 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %22
  store i32 %27, i32 addrspace(5)* %28, align 4, !tbaa !8
  %29 = add nuw nsw i32 %22, 1
  %30 = add i32 %23, 1
  %31 = icmp eq i32 %30, %14
  br i1 %31, label %32, label %21, !llvm.loop !12

32:                                               ; preds = %18, %21, %4
  %33 = icmp sgt i32 %2, 1
  br i1 %33, label %34, label %110

34:                                               ; preds = %32
  %35 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 0
  %36 = load i32, i32 addrspace(5)* %35, align 16, !tbaa !8
  %37 = add i32 %2, -1
  %38 = add i32 %2, -2
  %39 = and i32 %37, 7
  %40 = icmp ult i32 %38, 7
  br i1 %40, label %96, label %41

41:                                               ; preds = %34
  %42 = and i32 %37, -8
  br label %117

43:                                               ; preds = %43, %16
  %44 = phi i32 [ 0, %16 ], [ %93, %43 ]
  %45 = phi i32 [ 0, %16 ], [ %94, %43 ]
  %46 = add nsw i32 %44, %11
  %47 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %13, i32 %46, i32 0, i32 0, i32 0)
  %48 = bitcast float %47 to i32
  %49 = and i32 %48, 255
  %50 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %44
  store i32 %49, i32 addrspace(5)* %50, align 16, !tbaa !8
  %51 = or i32 %44, 1
  %52 = add nsw i32 %51, %11
  %53 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %13, i32 %52, i32 0, i32 0, i32 0)
  %54 = bitcast float %53 to i32
  %55 = and i32 %54, 255
  %56 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %51
  store i32 %55, i32 addrspace(5)* %56, align 4, !tbaa !8
  %57 = or i32 %44, 2
  %58 = add nsw i32 %57, %11
  %59 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %13, i32 %58, i32 0, i32 0, i32 0)
  %60 = bitcast float %59 to i32
  %61 = and i32 %60, 255
  %62 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %57
  store i32 %61, i32 addrspace(5)* %62, align 8, !tbaa !8
  %63 = or i32 %44, 3
  %64 = add nsw i32 %63, %11
  %65 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %13, i32 %64, i32 0, i32 0, i32 0)
  %66 = bitcast float %65 to i32
  %67 = and i32 %66, 255
  %68 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %63
  store i32 %67, i32 addrspace(5)* %68, align 4, !tbaa !8
  %69 = or i32 %44, 4
  %70 = add nsw i32 %69, %11
  %71 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %13, i32 %70, i32 0, i32 0, i32 0)
  %72 = bitcast float %71 to i32
  %73 = and i32 %72, 255
  %74 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %69
  store i32 %73, i32 addrspace(5)* %74, align 16, !tbaa !8
  %75 = or i32 %44, 5
  %76 = add nsw i32 %75, %11
  %77 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %13, i32 %76, i32 0, i32 0, i32 0)
  %78 = bitcast float %77 to i32
  %79 = and i32 %78, 255
  %80 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %75
  store i32 %79, i32 addrspace(5)* %80, align 4, !tbaa !8
  %81 = or i32 %44, 6
  %82 = add nsw i32 %81, %11
  %83 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %13, i32 %82, i32 0, i32 0, i32 0)
  %84 = bitcast float %83 to i32
  %85 = and i32 %84, 255
  %86 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %81
  store i32 %85, i32 addrspace(5)* %86, align 8, !tbaa !8
  %87 = or i32 %44, 7
  %88 = add nsw i32 %87, %11
  %89 = tail call float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %13, i32 %88, i32 0, i32 0, i32 0)
  %90 = bitcast float %89 to i32
  %91 = and i32 %90, 255
  %92 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %87
  store i32 %91, i32 addrspace(5)* %92, align 4, !tbaa !8
  %93 = add nuw nsw i32 %44, 8
  %94 = add i32 %45, 8
  %95 = icmp eq i32 %94, %17
  br i1 %95, label %18, label %43, !llvm.loop !14

96:                                               ; preds = %117, %34
  %97 = phi i32 [ %36, %34 ], [ %151, %117 ]
  %98 = phi i32 [ 1, %34 ], [ %152, %117 ]
  %99 = icmp eq i32 %39, 0
  br i1 %99, label %110, label %100

100:                                              ; preds = %96, %100
  %101 = phi i32 [ %106, %100 ], [ %97, %96 ]
  %102 = phi i32 [ %107, %100 ], [ %98, %96 ]
  %103 = phi i32 [ %108, %100 ], [ 0, %96 ]
  %104 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %102
  %105 = load i32, i32 addrspace(5)* %104, align 4, !tbaa !8
  %106 = add i32 %105, %101
  store i32 %106, i32 addrspace(5)* %104, align 4, !tbaa !8
  %107 = add nuw nsw i32 %102, 1
  %108 = add i32 %103, 1
  %109 = icmp eq i32 %108, %39
  br i1 %109, label %110, label %100, !llvm.loop !16

110:                                              ; preds = %96, %100, %32
  br i1 %8, label %111, label %169

111:                                              ; preds = %110
  %112 = mul nsw i32 %7, %2
  %113 = and i32 %2, 7
  %114 = icmp ult i32 %2, 8
  br i1 %114, label %155, label %115

115:                                              ; preds = %111
  %116 = and i32 %2, -8
  br label %170

117:                                              ; preds = %117, %41
  %118 = phi i32 [ %36, %41 ], [ %151, %117 ]
  %119 = phi i32 [ 1, %41 ], [ %152, %117 ]
  %120 = phi i32 [ 0, %41 ], [ %153, %117 ]
  %121 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %119
  %122 = load i32, i32 addrspace(5)* %121, align 4, !tbaa !8
  %123 = add i32 %122, %118
  store i32 %123, i32 addrspace(5)* %121, align 4, !tbaa !8
  %124 = add nuw nsw i32 %119, 1
  %125 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %124
  %126 = load i32, i32 addrspace(5)* %125, align 4, !tbaa !8
  %127 = add i32 %126, %123
  store i32 %127, i32 addrspace(5)* %125, align 4, !tbaa !8
  %128 = add nuw nsw i32 %119, 2
  %129 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %128
  %130 = load i32, i32 addrspace(5)* %129, align 4, !tbaa !8
  %131 = add i32 %130, %127
  store i32 %131, i32 addrspace(5)* %129, align 4, !tbaa !8
  %132 = add nuw nsw i32 %119, 3
  %133 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %132
  %134 = load i32, i32 addrspace(5)* %133, align 4, !tbaa !8
  %135 = add i32 %134, %131
  store i32 %135, i32 addrspace(5)* %133, align 4, !tbaa !8
  %136 = add nuw nsw i32 %119, 4
  %137 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %136
  %138 = load i32, i32 addrspace(5)* %137, align 4, !tbaa !8
  %139 = add i32 %138, %135
  store i32 %139, i32 addrspace(5)* %137, align 4, !tbaa !8
  %140 = add nuw nsw i32 %119, 5
  %141 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %140
  %142 = load i32, i32 addrspace(5)* %141, align 4, !tbaa !8
  %143 = add i32 %142, %139
  store i32 %143, i32 addrspace(5)* %141, align 4, !tbaa !8
  %144 = add nuw nsw i32 %119, 6
  %145 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %144
  %146 = load i32, i32 addrspace(5)* %145, align 4, !tbaa !8
  %147 = add i32 %146, %143
  store i32 %147, i32 addrspace(5)* %145, align 4, !tbaa !8
  %148 = add nuw nsw i32 %119, 7
  %149 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %148
  %150 = load i32, i32 addrspace(5)* %149, align 4, !tbaa !8
  %151 = add i32 %150, %147
  store i32 %151, i32 addrspace(5)* %149, align 4, !tbaa !8
  %152 = add nuw nsw i32 %119, 8
  %153 = add i32 %120, 8
  %154 = icmp eq i32 %153, %42
  br i1 %154, label %96, label %117, !llvm.loop !17

155:                                              ; preds = %170, %111
  %156 = phi i32 [ 0, %111 ], [ %220, %170 ]
  %157 = icmp eq i32 %113, 0
  br i1 %157, label %169, label %158

158:                                              ; preds = %155, %158
  %159 = phi i32 [ %166, %158 ], [ %156, %155 ]
  %160 = phi i32 [ %167, %158 ], [ 0, %155 ]
  %161 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %159
  %162 = load i32, i32 addrspace(5)* %161, align 4, !tbaa !8
  %163 = add nsw i32 %159, %112
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %164
  store i32 %162, i32 addrspace(1)* %165, align 4, !tbaa !8
  %166 = add nuw nsw i32 %159, 1
  %167 = add i32 %160, 1
  %168 = icmp eq i32 %167, %113
  br i1 %168, label %169, label %158, !llvm.loop !18

169:                                              ; preds = %155, %158, %110
  call void @llvm.lifetime.end.p5i8(i64 4096, i8 addrspace(5)* %6) #4
  ret void

170:                                              ; preds = %170, %115
  %171 = phi i32 [ 0, %115 ], [ %220, %170 ]
  %172 = phi i32 [ 0, %115 ], [ %221, %170 ]
  %173 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %171
  %174 = load i32, i32 addrspace(5)* %173, align 16, !tbaa !8
  %175 = add nsw i32 %171, %112
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %176
  store i32 %174, i32 addrspace(1)* %177, align 4, !tbaa !8
  %178 = or i32 %171, 1
  %179 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %178
  %180 = load i32, i32 addrspace(5)* %179, align 4, !tbaa !8
  %181 = add nsw i32 %178, %112
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %182
  store i32 %180, i32 addrspace(1)* %183, align 4, !tbaa !8
  %184 = or i32 %171, 2
  %185 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %184
  %186 = load i32, i32 addrspace(5)* %185, align 8, !tbaa !8
  %187 = add nsw i32 %184, %112
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %188
  store i32 %186, i32 addrspace(1)* %189, align 4, !tbaa !8
  %190 = or i32 %171, 3
  %191 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %190
  %192 = load i32, i32 addrspace(5)* %191, align 4, !tbaa !8
  %193 = add nsw i32 %190, %112
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %194
  store i32 %192, i32 addrspace(1)* %195, align 4, !tbaa !8
  %196 = or i32 %171, 4
  %197 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %196
  %198 = load i32, i32 addrspace(5)* %197, align 16, !tbaa !8
  %199 = add nsw i32 %196, %112
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %200
  store i32 %198, i32 addrspace(1)* %201, align 4, !tbaa !8
  %202 = or i32 %171, 5
  %203 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %202
  %204 = load i32, i32 addrspace(5)* %203, align 4, !tbaa !8
  %205 = add nsw i32 %202, %112
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %206
  store i32 %204, i32 addrspace(1)* %207, align 4, !tbaa !8
  %208 = or i32 %171, 6
  %209 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %208
  %210 = load i32, i32 addrspace(5)* %209, align 8, !tbaa !8
  %211 = add nsw i32 %208, %112
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %212
  store i32 %210, i32 addrspace(1)* %213, align 4, !tbaa !8
  %214 = or i32 %171, 7
  %215 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(5)* %5, i32 0, i32 %214
  %216 = load i32, i32 addrspace(5)* %215, align 4, !tbaa !8
  %217 = add nsw i32 %214, %112
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %218
  store i32 %216, i32 addrspace(1)* %219, align 4, !tbaa !8
  %220 = add nuw nsw i32 %171, 8
  %221 = add i32 %172, 8
  %222 = icmp eq i32 %221, %116
  br i1 %222, label %155, label %170, !llvm.loop !19
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: nounwind readonly willreturn
declare float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32>, i32, i32, i32, i32 immarg) #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !13}
!19 = distinct !{!19, !15}
