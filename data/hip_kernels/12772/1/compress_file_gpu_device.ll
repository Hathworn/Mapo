; ModuleID = '../data/hip_kernels/12772/1/main.cu'
source_filename = "../data/hip_kernels/12772/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@char_huffman_table_gpu = protected local_unnamed_addr addrspace(1) externally_initialized global [256 x [255 x i32]] zeroinitializer, align 16

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17final_compressionPiPbS0_i(i32 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = mul i32 %13, 255
  %15 = icmp slt i32 %13, %3
  br i1 %15, label %16, label %183

16:                                               ; preds = %4
  %17 = icmp sgt i32 %13, 0
  br i1 %17, label %18, label %41

18:                                               ; preds = %16
  %19 = add i32 %12, %11
  %20 = add i32 %19, -1
  %21 = and i32 %13, 7
  %22 = icmp ult i32 %20, 7
  br i1 %22, label %25, label %23

23:                                               ; preds = %18
  %24 = and i32 %13, -8
  br label %52

25:                                               ; preds = %52, %18
  %26 = phi i32 [ undef, %18 ], [ %94, %52 ]
  %27 = phi i32 [ 0, %18 ], [ %95, %52 ]
  %28 = phi i32 [ 0, %18 ], [ %94, %52 ]
  %29 = icmp eq i32 %21, 0
  br i1 %29, label %41, label %30

30:                                               ; preds = %25, %30
  %31 = phi i32 [ %38, %30 ], [ %27, %25 ]
  %32 = phi i32 [ %37, %30 ], [ %28, %25 ]
  %33 = phi i32 [ %39, %30 ], [ 0, %25 ]
  %34 = zext i32 %31 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = add nsw i32 %36, %32
  %38 = add nuw nsw i32 %31, 1
  %39 = add i32 %33, 1
  %40 = icmp eq i32 %39, %21
  br i1 %40, label %41, label %30, !llvm.loop !11

41:                                               ; preds = %25, %30, %16
  %42 = phi i32 [ 0, %16 ], [ %26, %25 ], [ %37, %30 ]
  %43 = sext i32 %13 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = icmp sgt i32 %45, 0
  br i1 %46, label %47, label %183

47:                                               ; preds = %41
  %48 = and i32 %45, 7
  %49 = icmp ult i32 %45, 8
  br i1 %49, label %167, label %50

50:                                               ; preds = %47
  %51 = and i32 %45, -8
  br label %98

52:                                               ; preds = %52, %23
  %53 = phi i32 [ 0, %23 ], [ %95, %52 ]
  %54 = phi i32 [ 0, %23 ], [ %94, %52 ]
  %55 = phi i32 [ 0, %23 ], [ %96, %52 ]
  %56 = zext i32 %53 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = add nsw i32 %58, %54
  %60 = or i32 %53, 1
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = add nsw i32 %63, %59
  %65 = or i32 %53, 2
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = add nsw i32 %68, %64
  %70 = or i32 %53, 3
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = add nsw i32 %73, %69
  %75 = or i32 %53, 4
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = add nsw i32 %78, %74
  %80 = or i32 %53, 5
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = add nsw i32 %83, %79
  %85 = or i32 %53, 6
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = add nsw i32 %88, %84
  %90 = or i32 %53, 7
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = add nsw i32 %93, %89
  %95 = add nuw nsw i32 %53, 8
  %96 = add i32 %55, 8
  %97 = icmp eq i32 %96, %24
  br i1 %97, label %25, label %52, !llvm.loop !13

98:                                               ; preds = %98, %50
  %99 = phi i32 [ 0, %50 ], [ %164, %98 ]
  %100 = phi i32 [ 0, %50 ], [ %165, %98 ]
  %101 = add nsw i32 %99, %14
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %102
  %104 = load i8, i8 addrspace(1)* %103, align 1, !tbaa !15, !range !17
  %105 = add nsw i32 %99, %42
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %106
  store i8 %104, i8 addrspace(1)* %107, align 1, !tbaa !15
  %108 = or i32 %99, 1
  %109 = add nsw i32 %108, %14
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %110
  %112 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !15, !range !17
  %113 = add nsw i32 %108, %42
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %114
  store i8 %112, i8 addrspace(1)* %115, align 1, !tbaa !15
  %116 = or i32 %99, 2
  %117 = add nsw i32 %116, %14
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %118
  %120 = load i8, i8 addrspace(1)* %119, align 1, !tbaa !15, !range !17
  %121 = add nsw i32 %116, %42
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %122
  store i8 %120, i8 addrspace(1)* %123, align 1, !tbaa !15
  %124 = or i32 %99, 3
  %125 = add nsw i32 %124, %14
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %126
  %128 = load i8, i8 addrspace(1)* %127, align 1, !tbaa !15, !range !17
  %129 = add nsw i32 %124, %42
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %130
  store i8 %128, i8 addrspace(1)* %131, align 1, !tbaa !15
  %132 = or i32 %99, 4
  %133 = add nsw i32 %132, %14
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %134
  %136 = load i8, i8 addrspace(1)* %135, align 1, !tbaa !15, !range !17
  %137 = add nsw i32 %132, %42
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %138
  store i8 %136, i8 addrspace(1)* %139, align 1, !tbaa !15
  %140 = or i32 %99, 5
  %141 = add nsw i32 %140, %14
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %142
  %144 = load i8, i8 addrspace(1)* %143, align 1, !tbaa !15, !range !17
  %145 = add nsw i32 %140, %42
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %146
  store i8 %144, i8 addrspace(1)* %147, align 1, !tbaa !15
  %148 = or i32 %99, 6
  %149 = add nsw i32 %148, %14
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %150
  %152 = load i8, i8 addrspace(1)* %151, align 1, !tbaa !15, !range !17
  %153 = add nsw i32 %148, %42
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %154
  store i8 %152, i8 addrspace(1)* %155, align 1, !tbaa !15
  %156 = or i32 %99, 7
  %157 = add nsw i32 %156, %14
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %158
  %160 = load i8, i8 addrspace(1)* %159, align 1, !tbaa !15, !range !17
  %161 = add nsw i32 %156, %42
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %162
  store i8 %160, i8 addrspace(1)* %163, align 1, !tbaa !15
  %164 = add nuw nsw i32 %99, 8
  %165 = add i32 %100, 8
  %166 = icmp eq i32 %165, %51
  br i1 %166, label %167, label %98, !llvm.loop !18

167:                                              ; preds = %98, %47
  %168 = phi i32 [ 0, %47 ], [ %164, %98 ]
  %169 = icmp eq i32 %48, 0
  br i1 %169, label %183, label %170

170:                                              ; preds = %167, %170
  %171 = phi i32 [ %180, %170 ], [ %168, %167 ]
  %172 = phi i32 [ %181, %170 ], [ 0, %167 ]
  %173 = add nsw i32 %171, %14
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %174
  %176 = load i8, i8 addrspace(1)* %175, align 1, !tbaa !15, !range !17
  %177 = add nsw i32 %171, %42
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %178
  store i8 %176, i8 addrspace(1)* %179, align 1, !tbaa !15
  %180 = add nuw nsw i32 %171, 1
  %181 = add i32 %172, 1
  %182 = icmp eq i32 %181, %48
  br i1 %182, label %183, label %170, !llvm.loop !19

183:                                              ; preds = %167, %170, %41, %4
  ret void
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17compress_file_gpuPhPbPiS1_S1_S1_S1_i(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture readnone %4, i32 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture readonly %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = mul i32 %17, 255
  %19 = icmp slt i32 %17, %7
  br i1 %19, label %20, label %99

20:                                               ; preds = %8
  %21 = sext i32 %17 to i64
  %22 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %21
  %23 = load i8, i8 addrspace(1)* %22, align 1, !tbaa !20, !amdgpu.noclobber !5
  %24 = zext i8 %23 to i32
  %25 = mul nuw nsw i32 %24, 255
  br label %26

26:                                               ; preds = %77, %20
  %27 = phi i32 [ 0, %20 ], [ %82, %77 ]
  %28 = add nuw nsw i32 %27, %25
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  switch i32 %31, label %84 [
    i32 0, label %33
    i32 1, label %32
  ]

32:                                               ; preds = %26
  br label %33

33:                                               ; preds = %26, %32
  %34 = phi i8 [ 1, %32 ], [ 0, %26 ]
  %35 = add nsw i32 %27, %18
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %36
  store i8 %34, i8 addrspace(1)* %37, align 1, !tbaa !15
  %38 = add nuw nsw i32 %27, 1
  %39 = add nuw nsw i32 %38, %25
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  switch i32 %42, label %84 [
    i32 0, label %44
    i32 1, label %43
  ]

43:                                               ; preds = %33
  br label %44

44:                                               ; preds = %43, %33
  %45 = phi i8 [ 1, %43 ], [ 0, %33 ]
  %46 = add nsw i32 %38, %18
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %47
  store i8 %45, i8 addrspace(1)* %48, align 1, !tbaa !15
  %49 = add nuw nsw i32 %27, 2
  %50 = add nuw nsw i32 %49, %25
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  switch i32 %53, label %84 [
    i32 0, label %55
    i32 1, label %54
  ]

54:                                               ; preds = %44
  br label %55

55:                                               ; preds = %54, %44
  %56 = phi i8 [ 1, %54 ], [ 0, %44 ]
  %57 = add nsw i32 %49, %18
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %58
  store i8 %56, i8 addrspace(1)* %59, align 1, !tbaa !15
  %60 = add nuw nsw i32 %27, 3
  %61 = add nuw nsw i32 %60, %25
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  switch i32 %64, label %84 [
    i32 0, label %66
    i32 1, label %65
  ]

65:                                               ; preds = %55
  br label %66

66:                                               ; preds = %65, %55
  %67 = phi i8 [ 1, %65 ], [ 0, %55 ]
  %68 = add nsw i32 %60, %18
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %69
  store i8 %67, i8 addrspace(1)* %70, align 1, !tbaa !15
  %71 = add nuw nsw i32 %27, 4
  %72 = add nuw nsw i32 %71, %25
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  switch i32 %75, label %84 [
    i32 0, label %77
    i32 1, label %76
  ]

76:                                               ; preds = %66
  br label %77

77:                                               ; preds = %76, %66
  %78 = phi i8 [ 1, %76 ], [ 0, %66 ]
  %79 = add nsw i32 %71, %18
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %80
  store i8 %78, i8 addrspace(1)* %81, align 1, !tbaa !15
  %82 = add nuw nsw i32 %27, 5
  %83 = icmp eq i32 %82, 255
  br i1 %83, label %84, label %26, !llvm.loop !21

84:                                               ; preds = %77, %66, %55, %44, %33, %26
  %85 = phi i32 [ %27, %26 ], [ %38, %33 ], [ %49, %44 ], [ %60, %55 ], [ %71, %66 ], [ 255, %77 ]
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %21
  store i32 %85, i32 addrspace(1)* %86, align 4, !tbaa !7
  store i32 0, i32 addrspace(1)* %5, align 4, !tbaa !7
  %87 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !7
  %88 = icmp sgt i32 %87, 0
  br i1 %88, label %89, label %99

89:                                               ; preds = %84, %89
  %90 = phi i32 [ %95, %89 ], [ 0, %84 ]
  %91 = phi i32 [ %96, %89 ], [ 0, %84 ]
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !7
  %95 = add nsw i32 %94, %90
  store i32 %95, i32 addrspace(1)* %5, align 4, !tbaa !7
  %96 = add nuw nsw i32 %91, 1
  %97 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !7
  %98 = icmp slt i32 %96, %97
  br i1 %98, label %89, label %99, !llvm.loop !22

99:                                               ; preds = %89, %84, %8
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!16, !16, i64 0}
!16 = !{!"bool", !9, i64 0}
!17 = !{i8 0, i8 2}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !12}
!20 = !{!9, !9, i64 0}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !14}
