; ModuleID = '../data/hip_kernels/14345/2/main.cu'
source_filename = "../data/hip_kernels/14345/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z10InitArraysPfS_S_Pii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul i32 %6, %4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %4, %13
  %15 = mul i32 %14, %8
  %16 = sext i32 %7 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %17, i64 %18
  %20 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  %21 = getelementptr inbounds float, float addrspace(1)* %20, i64 %18
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  %23 = getelementptr inbounds float, float addrspace(1)* %22, i64 %18
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %16
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %18
  %26 = icmp sgt i32 %14, 0
  br i1 %26, label %27, label %99

27:                                               ; preds = %5
  %28 = and i32 %14, 7
  %29 = icmp ult i32 %14, 8
  br i1 %29, label %85, label %30

30:                                               ; preds = %27
  %31 = and i32 %14, -8
  br label %32

32:                                               ; preds = %32, %30
  %33 = phi i32 [ 0, %30 ], [ %82, %32 ]
  %34 = phi i32 [ 0, %30 ], [ %83, %32 ]
  %35 = zext i32 %33 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %21, i64 %35
  store float -1.000000e+00, float addrspace(1)* %36, align 4, !tbaa !7
  %37 = getelementptr inbounds float, float addrspace(1)* %19, i64 %35
  store float 5.000000e+01, float addrspace(1)* %37, align 4, !tbaa !7
  %38 = getelementptr inbounds float, float addrspace(1)* %23, i64 %35
  store float 5.000000e+01, float addrspace(1)* %38, align 4, !tbaa !7
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %35
  store i32 1, i32 addrspace(1)* %39, align 4, !tbaa !11
  %40 = or i32 %33, 1
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %21, i64 %41
  store float -1.000000e+00, float addrspace(1)* %42, align 4, !tbaa !7
  %43 = getelementptr inbounds float, float addrspace(1)* %19, i64 %41
  store float 5.000000e+01, float addrspace(1)* %43, align 4, !tbaa !7
  %44 = getelementptr inbounds float, float addrspace(1)* %23, i64 %41
  store float 5.000000e+01, float addrspace(1)* %44, align 4, !tbaa !7
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %41
  store i32 1, i32 addrspace(1)* %45, align 4, !tbaa !11
  %46 = or i32 %33, 2
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %21, i64 %47
  store float -1.000000e+00, float addrspace(1)* %48, align 4, !tbaa !7
  %49 = getelementptr inbounds float, float addrspace(1)* %19, i64 %47
  store float 5.000000e+01, float addrspace(1)* %49, align 4, !tbaa !7
  %50 = getelementptr inbounds float, float addrspace(1)* %23, i64 %47
  store float 5.000000e+01, float addrspace(1)* %50, align 4, !tbaa !7
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %47
  store i32 1, i32 addrspace(1)* %51, align 4, !tbaa !11
  %52 = or i32 %33, 3
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %21, i64 %53
  store float -1.000000e+00, float addrspace(1)* %54, align 4, !tbaa !7
  %55 = getelementptr inbounds float, float addrspace(1)* %19, i64 %53
  store float 5.000000e+01, float addrspace(1)* %55, align 4, !tbaa !7
  %56 = getelementptr inbounds float, float addrspace(1)* %23, i64 %53
  store float 5.000000e+01, float addrspace(1)* %56, align 4, !tbaa !7
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %53
  store i32 1, i32 addrspace(1)* %57, align 4, !tbaa !11
  %58 = or i32 %33, 4
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %21, i64 %59
  store float -1.000000e+00, float addrspace(1)* %60, align 4, !tbaa !7
  %61 = getelementptr inbounds float, float addrspace(1)* %19, i64 %59
  store float 5.000000e+01, float addrspace(1)* %61, align 4, !tbaa !7
  %62 = getelementptr inbounds float, float addrspace(1)* %23, i64 %59
  store float 5.000000e+01, float addrspace(1)* %62, align 4, !tbaa !7
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %59
  store i32 1, i32 addrspace(1)* %63, align 4, !tbaa !11
  %64 = or i32 %33, 5
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %21, i64 %65
  store float -1.000000e+00, float addrspace(1)* %66, align 4, !tbaa !7
  %67 = getelementptr inbounds float, float addrspace(1)* %19, i64 %65
  store float 5.000000e+01, float addrspace(1)* %67, align 4, !tbaa !7
  %68 = getelementptr inbounds float, float addrspace(1)* %23, i64 %65
  store float 5.000000e+01, float addrspace(1)* %68, align 4, !tbaa !7
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %65
  store i32 1, i32 addrspace(1)* %69, align 4, !tbaa !11
  %70 = or i32 %33, 6
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %21, i64 %71
  store float -1.000000e+00, float addrspace(1)* %72, align 4, !tbaa !7
  %73 = getelementptr inbounds float, float addrspace(1)* %19, i64 %71
  store float 5.000000e+01, float addrspace(1)* %73, align 4, !tbaa !7
  %74 = getelementptr inbounds float, float addrspace(1)* %23, i64 %71
  store float 5.000000e+01, float addrspace(1)* %74, align 4, !tbaa !7
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %71
  store i32 1, i32 addrspace(1)* %75, align 4, !tbaa !11
  %76 = or i32 %33, 7
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %21, i64 %77
  store float -1.000000e+00, float addrspace(1)* %78, align 4, !tbaa !7
  %79 = getelementptr inbounds float, float addrspace(1)* %19, i64 %77
  store float 5.000000e+01, float addrspace(1)* %79, align 4, !tbaa !7
  %80 = getelementptr inbounds float, float addrspace(1)* %23, i64 %77
  store float 5.000000e+01, float addrspace(1)* %80, align 4, !tbaa !7
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %77
  store i32 1, i32 addrspace(1)* %81, align 4, !tbaa !11
  %82 = add nuw nsw i32 %33, 8
  %83 = add i32 %34, 8
  %84 = icmp eq i32 %83, %31
  br i1 %84, label %85, label %32, !llvm.loop !13

85:                                               ; preds = %32, %27
  %86 = phi i32 [ 0, %27 ], [ %82, %32 ]
  %87 = icmp eq i32 %28, 0
  br i1 %87, label %99, label %88

88:                                               ; preds = %85, %88
  %89 = phi i32 [ %96, %88 ], [ %86, %85 ]
  %90 = phi i32 [ %97, %88 ], [ 0, %85 ]
  %91 = zext i32 %89 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %21, i64 %91
  store float -1.000000e+00, float addrspace(1)* %92, align 4, !tbaa !7
  %93 = getelementptr inbounds float, float addrspace(1)* %19, i64 %91
  store float 5.000000e+01, float addrspace(1)* %93, align 4, !tbaa !7
  %94 = getelementptr inbounds float, float addrspace(1)* %23, i64 %91
  store float 5.000000e+01, float addrspace(1)* %94, align 4, !tbaa !7
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %91
  store i32 1, i32 addrspace(1)* %95, align 4, !tbaa !11
  %96 = add nuw nsw i32 %89, 1
  %97 = add i32 %90, 1
  %98 = icmp eq i32 %97, %28
  br i1 %98, label %99, label %88, !llvm.loop !15

99:                                               ; preds = %85, %88, %5
  %100 = icmp eq i32 %15, 0
  br i1 %100, label %101, label %102

101:                                              ; preds = %99
  store float 1.000000e+00, float addrspace(1)* %21, align 4, !tbaa !7
  store float 0.000000e+00, float addrspace(1)* %19, align 4, !tbaa !7
  store float 0.000000e+00, float addrspace(1)* %23, align 4, !tbaa !7
  store i32 0, i32 addrspace(1)* %25, align 4, !tbaa !11
  br label %102

102:                                              ; preds = %101, %99
  %103 = add nsw i32 %15, %14
  %104 = icmp slt i32 %103, %4
  br i1 %104, label %112, label %105

105:                                              ; preds = %102
  %106 = add nsw i32 %14, -1
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %21, i64 %107
  store float 1.000000e+00, float addrspace(1)* %108, align 4, !tbaa !7
  %109 = getelementptr inbounds float, float addrspace(1)* %19, i64 %107
  store float 0.000000e+00, float addrspace(1)* %109, align 4, !tbaa !7
  %110 = getelementptr inbounds float, float addrspace(1)* %23, i64 %107
  store float 0.000000e+00, float addrspace(1)* %110, align 4, !tbaa !7
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %107
  store i32 0, i32 addrspace(1)* %111, align 4, !tbaa !11
  br label %112

112:                                              ; preds = %105, %102
  %113 = icmp eq i32 %7, 0
  %114 = select i1 %113, i1 %26, i1 false
  br i1 %114, label %115, label %187

115:                                              ; preds = %112
  %116 = and i32 %14, 7
  %117 = icmp ult i32 %14, 8
  br i1 %117, label %173, label %118

118:                                              ; preds = %115
  %119 = and i32 %14, -8
  br label %120

120:                                              ; preds = %120, %118
  %121 = phi i32 [ 0, %118 ], [ %170, %120 ]
  %122 = phi i32 [ 0, %118 ], [ %171, %120 ]
  %123 = zext i32 %121 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %21, i64 %123
  store float 1.000000e+00, float addrspace(1)* %124, align 4, !tbaa !7
  %125 = getelementptr inbounds float, float addrspace(1)* %19, i64 %123
  store float 0.000000e+00, float addrspace(1)* %125, align 4, !tbaa !7
  %126 = getelementptr inbounds float, float addrspace(1)* %23, i64 %123
  store float 0.000000e+00, float addrspace(1)* %126, align 4, !tbaa !7
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %123
  store i32 0, i32 addrspace(1)* %127, align 4, !tbaa !11
  %128 = or i32 %121, 1
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %21, i64 %129
  store float 1.000000e+00, float addrspace(1)* %130, align 4, !tbaa !7
  %131 = getelementptr inbounds float, float addrspace(1)* %19, i64 %129
  store float 0.000000e+00, float addrspace(1)* %131, align 4, !tbaa !7
  %132 = getelementptr inbounds float, float addrspace(1)* %23, i64 %129
  store float 0.000000e+00, float addrspace(1)* %132, align 4, !tbaa !7
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %129
  store i32 0, i32 addrspace(1)* %133, align 4, !tbaa !11
  %134 = or i32 %121, 2
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %21, i64 %135
  store float 1.000000e+00, float addrspace(1)* %136, align 4, !tbaa !7
  %137 = getelementptr inbounds float, float addrspace(1)* %19, i64 %135
  store float 0.000000e+00, float addrspace(1)* %137, align 4, !tbaa !7
  %138 = getelementptr inbounds float, float addrspace(1)* %23, i64 %135
  store float 0.000000e+00, float addrspace(1)* %138, align 4, !tbaa !7
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %135
  store i32 0, i32 addrspace(1)* %139, align 4, !tbaa !11
  %140 = or i32 %121, 3
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %21, i64 %141
  store float 1.000000e+00, float addrspace(1)* %142, align 4, !tbaa !7
  %143 = getelementptr inbounds float, float addrspace(1)* %19, i64 %141
  store float 0.000000e+00, float addrspace(1)* %143, align 4, !tbaa !7
  %144 = getelementptr inbounds float, float addrspace(1)* %23, i64 %141
  store float 0.000000e+00, float addrspace(1)* %144, align 4, !tbaa !7
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %141
  store i32 0, i32 addrspace(1)* %145, align 4, !tbaa !11
  %146 = or i32 %121, 4
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %21, i64 %147
  store float 1.000000e+00, float addrspace(1)* %148, align 4, !tbaa !7
  %149 = getelementptr inbounds float, float addrspace(1)* %19, i64 %147
  store float 0.000000e+00, float addrspace(1)* %149, align 4, !tbaa !7
  %150 = getelementptr inbounds float, float addrspace(1)* %23, i64 %147
  store float 0.000000e+00, float addrspace(1)* %150, align 4, !tbaa !7
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %147
  store i32 0, i32 addrspace(1)* %151, align 4, !tbaa !11
  %152 = or i32 %121, 5
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %21, i64 %153
  store float 1.000000e+00, float addrspace(1)* %154, align 4, !tbaa !7
  %155 = getelementptr inbounds float, float addrspace(1)* %19, i64 %153
  store float 0.000000e+00, float addrspace(1)* %155, align 4, !tbaa !7
  %156 = getelementptr inbounds float, float addrspace(1)* %23, i64 %153
  store float 0.000000e+00, float addrspace(1)* %156, align 4, !tbaa !7
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %153
  store i32 0, i32 addrspace(1)* %157, align 4, !tbaa !11
  %158 = or i32 %121, 6
  %159 = zext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %21, i64 %159
  store float 1.000000e+00, float addrspace(1)* %160, align 4, !tbaa !7
  %161 = getelementptr inbounds float, float addrspace(1)* %19, i64 %159
  store float 0.000000e+00, float addrspace(1)* %161, align 4, !tbaa !7
  %162 = getelementptr inbounds float, float addrspace(1)* %23, i64 %159
  store float 0.000000e+00, float addrspace(1)* %162, align 4, !tbaa !7
  %163 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %159
  store i32 0, i32 addrspace(1)* %163, align 4, !tbaa !11
  %164 = or i32 %121, 7
  %165 = zext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %21, i64 %165
  store float 1.000000e+00, float addrspace(1)* %166, align 4, !tbaa !7
  %167 = getelementptr inbounds float, float addrspace(1)* %19, i64 %165
  store float 0.000000e+00, float addrspace(1)* %167, align 4, !tbaa !7
  %168 = getelementptr inbounds float, float addrspace(1)* %23, i64 %165
  store float 0.000000e+00, float addrspace(1)* %168, align 4, !tbaa !7
  %169 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %165
  store i32 0, i32 addrspace(1)* %169, align 4, !tbaa !11
  %170 = add nuw nsw i32 %121, 8
  %171 = add i32 %122, 8
  %172 = icmp eq i32 %171, %119
  br i1 %172, label %173, label %120, !llvm.loop !17

173:                                              ; preds = %120, %115
  %174 = phi i32 [ 0, %115 ], [ %170, %120 ]
  %175 = icmp eq i32 %116, 0
  br i1 %175, label %187, label %176

176:                                              ; preds = %173, %176
  %177 = phi i32 [ %184, %176 ], [ %174, %173 ]
  %178 = phi i32 [ %185, %176 ], [ 0, %173 ]
  %179 = zext i32 %177 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %21, i64 %179
  store float 1.000000e+00, float addrspace(1)* %180, align 4, !tbaa !7
  %181 = getelementptr inbounds float, float addrspace(1)* %19, i64 %179
  store float 0.000000e+00, float addrspace(1)* %181, align 4, !tbaa !7
  %182 = getelementptr inbounds float, float addrspace(1)* %23, i64 %179
  store float 0.000000e+00, float addrspace(1)* %182, align 4, !tbaa !7
  %183 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %179
  store i32 0, i32 addrspace(1)* %183, align 4, !tbaa !11
  %184 = add nuw nsw i32 %177, 1
  %185 = add i32 %178, 1
  %186 = icmp eq i32 %185, %116
  br i1 %186, label %187, label %176, !llvm.loop !18

187:                                              ; preds = %173, %176, %112
  %188 = add nsw i32 %4, -1
  %189 = icmp eq i32 %7, %188
  %190 = select i1 %189, i1 %26, i1 false
  br i1 %190, label %191, label %263

191:                                              ; preds = %187
  %192 = and i32 %14, 7
  %193 = icmp ult i32 %14, 8
  br i1 %193, label %249, label %194

194:                                              ; preds = %191
  %195 = and i32 %14, -8
  br label %196

196:                                              ; preds = %196, %194
  %197 = phi i32 [ 0, %194 ], [ %246, %196 ]
  %198 = phi i32 [ 0, %194 ], [ %247, %196 ]
  %199 = zext i32 %197 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %21, i64 %199
  store float 1.000000e+00, float addrspace(1)* %200, align 4, !tbaa !7
  %201 = getelementptr inbounds float, float addrspace(1)* %19, i64 %199
  store float 1.000000e+02, float addrspace(1)* %201, align 4, !tbaa !7
  %202 = getelementptr inbounds float, float addrspace(1)* %23, i64 %199
  store float 1.000000e+02, float addrspace(1)* %202, align 4, !tbaa !7
  %203 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %199
  store i32 0, i32 addrspace(1)* %203, align 4, !tbaa !11
  %204 = or i32 %197, 1
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %21, i64 %205
  store float 1.000000e+00, float addrspace(1)* %206, align 4, !tbaa !7
  %207 = getelementptr inbounds float, float addrspace(1)* %19, i64 %205
  store float 1.000000e+02, float addrspace(1)* %207, align 4, !tbaa !7
  %208 = getelementptr inbounds float, float addrspace(1)* %23, i64 %205
  store float 1.000000e+02, float addrspace(1)* %208, align 4, !tbaa !7
  %209 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %205
  store i32 0, i32 addrspace(1)* %209, align 4, !tbaa !11
  %210 = or i32 %197, 2
  %211 = zext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %21, i64 %211
  store float 1.000000e+00, float addrspace(1)* %212, align 4, !tbaa !7
  %213 = getelementptr inbounds float, float addrspace(1)* %19, i64 %211
  store float 1.000000e+02, float addrspace(1)* %213, align 4, !tbaa !7
  %214 = getelementptr inbounds float, float addrspace(1)* %23, i64 %211
  store float 1.000000e+02, float addrspace(1)* %214, align 4, !tbaa !7
  %215 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %211
  store i32 0, i32 addrspace(1)* %215, align 4, !tbaa !11
  %216 = or i32 %197, 3
  %217 = zext i32 %216 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %21, i64 %217
  store float 1.000000e+00, float addrspace(1)* %218, align 4, !tbaa !7
  %219 = getelementptr inbounds float, float addrspace(1)* %19, i64 %217
  store float 1.000000e+02, float addrspace(1)* %219, align 4, !tbaa !7
  %220 = getelementptr inbounds float, float addrspace(1)* %23, i64 %217
  store float 1.000000e+02, float addrspace(1)* %220, align 4, !tbaa !7
  %221 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %217
  store i32 0, i32 addrspace(1)* %221, align 4, !tbaa !11
  %222 = or i32 %197, 4
  %223 = zext i32 %222 to i64
  %224 = getelementptr inbounds float, float addrspace(1)* %21, i64 %223
  store float 1.000000e+00, float addrspace(1)* %224, align 4, !tbaa !7
  %225 = getelementptr inbounds float, float addrspace(1)* %19, i64 %223
  store float 1.000000e+02, float addrspace(1)* %225, align 4, !tbaa !7
  %226 = getelementptr inbounds float, float addrspace(1)* %23, i64 %223
  store float 1.000000e+02, float addrspace(1)* %226, align 4, !tbaa !7
  %227 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %223
  store i32 0, i32 addrspace(1)* %227, align 4, !tbaa !11
  %228 = or i32 %197, 5
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %21, i64 %229
  store float 1.000000e+00, float addrspace(1)* %230, align 4, !tbaa !7
  %231 = getelementptr inbounds float, float addrspace(1)* %19, i64 %229
  store float 1.000000e+02, float addrspace(1)* %231, align 4, !tbaa !7
  %232 = getelementptr inbounds float, float addrspace(1)* %23, i64 %229
  store float 1.000000e+02, float addrspace(1)* %232, align 4, !tbaa !7
  %233 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %229
  store i32 0, i32 addrspace(1)* %233, align 4, !tbaa !11
  %234 = or i32 %197, 6
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds float, float addrspace(1)* %21, i64 %235
  store float 1.000000e+00, float addrspace(1)* %236, align 4, !tbaa !7
  %237 = getelementptr inbounds float, float addrspace(1)* %19, i64 %235
  store float 1.000000e+02, float addrspace(1)* %237, align 4, !tbaa !7
  %238 = getelementptr inbounds float, float addrspace(1)* %23, i64 %235
  store float 1.000000e+02, float addrspace(1)* %238, align 4, !tbaa !7
  %239 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %235
  store i32 0, i32 addrspace(1)* %239, align 4, !tbaa !11
  %240 = or i32 %197, 7
  %241 = zext i32 %240 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %21, i64 %241
  store float 1.000000e+00, float addrspace(1)* %242, align 4, !tbaa !7
  %243 = getelementptr inbounds float, float addrspace(1)* %19, i64 %241
  store float 1.000000e+02, float addrspace(1)* %243, align 4, !tbaa !7
  %244 = getelementptr inbounds float, float addrspace(1)* %23, i64 %241
  store float 1.000000e+02, float addrspace(1)* %244, align 4, !tbaa !7
  %245 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %241
  store i32 0, i32 addrspace(1)* %245, align 4, !tbaa !11
  %246 = add nuw nsw i32 %197, 8
  %247 = add i32 %198, 8
  %248 = icmp eq i32 %247, %195
  br i1 %248, label %249, label %196, !llvm.loop !19

249:                                              ; preds = %196, %191
  %250 = phi i32 [ 0, %191 ], [ %246, %196 ]
  %251 = icmp eq i32 %192, 0
  br i1 %251, label %263, label %252

252:                                              ; preds = %249, %252
  %253 = phi i32 [ %260, %252 ], [ %250, %249 ]
  %254 = phi i32 [ %261, %252 ], [ 0, %249 ]
  %255 = zext i32 %253 to i64
  %256 = getelementptr inbounds float, float addrspace(1)* %21, i64 %255
  store float 1.000000e+00, float addrspace(1)* %256, align 4, !tbaa !7
  %257 = getelementptr inbounds float, float addrspace(1)* %19, i64 %255
  store float 1.000000e+02, float addrspace(1)* %257, align 4, !tbaa !7
  %258 = getelementptr inbounds float, float addrspace(1)* %23, i64 %255
  store float 1.000000e+02, float addrspace(1)* %258, align 4, !tbaa !7
  %259 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %255
  store i32 0, i32 addrspace(1)* %259, align 4, !tbaa !11
  %260 = add nuw nsw i32 %253, 1
  %261 = add i32 %254, 1
  %262 = icmp eq i32 %261, %192
  br i1 %262, label %263, label %252, !llvm.loop !20

263:                                              ; preds = %249, %252, %187
  %264 = icmp eq i32 %7, 400
  %265 = icmp slt i32 %15, 330
  %266 = select i1 %264, i1 %265, i1 false
  br i1 %266, label %267, label %417

267:                                              ; preds = %263
  %268 = icmp sgt i32 %103, 330
  br i1 %268, label %275, label %269

269:                                              ; preds = %267
  br i1 %26, label %270, label %417

270:                                              ; preds = %269
  %271 = and i32 %14, 7
  %272 = icmp ult i32 %14, 8
  br i1 %272, label %403, label %273

273:                                              ; preds = %270
  %274 = and i32 %14, -8
  br label %336

275:                                              ; preds = %267
  %276 = sub i32 330, %15
  %277 = tail call i32 @llvm.smax.i32(i32 %276, i32 1)
  %278 = add nsw i32 %277, -1
  %279 = and i32 %277, 7
  %280 = icmp ult i32 %278, 7
  br i1 %280, label %389, label %281

281:                                              ; preds = %275
  %282 = and i32 %277, 2147483640
  br label %283

283:                                              ; preds = %283, %281
  %284 = phi i32 [ 0, %281 ], [ %333, %283 ]
  %285 = phi i32 [ 0, %281 ], [ %334, %283 ]
  %286 = zext i32 %284 to i64
  %287 = getelementptr inbounds float, float addrspace(1)* %21, i64 %286
  store float 1.000000e+00, float addrspace(1)* %287, align 4, !tbaa !7
  %288 = getelementptr inbounds float, float addrspace(1)* %19, i64 %286
  store float 1.000000e+02, float addrspace(1)* %288, align 4, !tbaa !7
  %289 = getelementptr inbounds float, float addrspace(1)* %23, i64 %286
  store float 1.000000e+02, float addrspace(1)* %289, align 4, !tbaa !7
  %290 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %286
  store i32 0, i32 addrspace(1)* %290, align 4, !tbaa !11
  %291 = or i32 %284, 1
  %292 = zext i32 %291 to i64
  %293 = getelementptr inbounds float, float addrspace(1)* %21, i64 %292
  store float 1.000000e+00, float addrspace(1)* %293, align 4, !tbaa !7
  %294 = getelementptr inbounds float, float addrspace(1)* %19, i64 %292
  store float 1.000000e+02, float addrspace(1)* %294, align 4, !tbaa !7
  %295 = getelementptr inbounds float, float addrspace(1)* %23, i64 %292
  store float 1.000000e+02, float addrspace(1)* %295, align 4, !tbaa !7
  %296 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %292
  store i32 0, i32 addrspace(1)* %296, align 4, !tbaa !11
  %297 = or i32 %284, 2
  %298 = zext i32 %297 to i64
  %299 = getelementptr inbounds float, float addrspace(1)* %21, i64 %298
  store float 1.000000e+00, float addrspace(1)* %299, align 4, !tbaa !7
  %300 = getelementptr inbounds float, float addrspace(1)* %19, i64 %298
  store float 1.000000e+02, float addrspace(1)* %300, align 4, !tbaa !7
  %301 = getelementptr inbounds float, float addrspace(1)* %23, i64 %298
  store float 1.000000e+02, float addrspace(1)* %301, align 4, !tbaa !7
  %302 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %298
  store i32 0, i32 addrspace(1)* %302, align 4, !tbaa !11
  %303 = or i32 %284, 3
  %304 = zext i32 %303 to i64
  %305 = getelementptr inbounds float, float addrspace(1)* %21, i64 %304
  store float 1.000000e+00, float addrspace(1)* %305, align 4, !tbaa !7
  %306 = getelementptr inbounds float, float addrspace(1)* %19, i64 %304
  store float 1.000000e+02, float addrspace(1)* %306, align 4, !tbaa !7
  %307 = getelementptr inbounds float, float addrspace(1)* %23, i64 %304
  store float 1.000000e+02, float addrspace(1)* %307, align 4, !tbaa !7
  %308 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %304
  store i32 0, i32 addrspace(1)* %308, align 4, !tbaa !11
  %309 = or i32 %284, 4
  %310 = zext i32 %309 to i64
  %311 = getelementptr inbounds float, float addrspace(1)* %21, i64 %310
  store float 1.000000e+00, float addrspace(1)* %311, align 4, !tbaa !7
  %312 = getelementptr inbounds float, float addrspace(1)* %19, i64 %310
  store float 1.000000e+02, float addrspace(1)* %312, align 4, !tbaa !7
  %313 = getelementptr inbounds float, float addrspace(1)* %23, i64 %310
  store float 1.000000e+02, float addrspace(1)* %313, align 4, !tbaa !7
  %314 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %310
  store i32 0, i32 addrspace(1)* %314, align 4, !tbaa !11
  %315 = or i32 %284, 5
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds float, float addrspace(1)* %21, i64 %316
  store float 1.000000e+00, float addrspace(1)* %317, align 4, !tbaa !7
  %318 = getelementptr inbounds float, float addrspace(1)* %19, i64 %316
  store float 1.000000e+02, float addrspace(1)* %318, align 4, !tbaa !7
  %319 = getelementptr inbounds float, float addrspace(1)* %23, i64 %316
  store float 1.000000e+02, float addrspace(1)* %319, align 4, !tbaa !7
  %320 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %316
  store i32 0, i32 addrspace(1)* %320, align 4, !tbaa !11
  %321 = or i32 %284, 6
  %322 = zext i32 %321 to i64
  %323 = getelementptr inbounds float, float addrspace(1)* %21, i64 %322
  store float 1.000000e+00, float addrspace(1)* %323, align 4, !tbaa !7
  %324 = getelementptr inbounds float, float addrspace(1)* %19, i64 %322
  store float 1.000000e+02, float addrspace(1)* %324, align 4, !tbaa !7
  %325 = getelementptr inbounds float, float addrspace(1)* %23, i64 %322
  store float 1.000000e+02, float addrspace(1)* %325, align 4, !tbaa !7
  %326 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %322
  store i32 0, i32 addrspace(1)* %326, align 4, !tbaa !11
  %327 = or i32 %284, 7
  %328 = zext i32 %327 to i64
  %329 = getelementptr inbounds float, float addrspace(1)* %21, i64 %328
  store float 1.000000e+00, float addrspace(1)* %329, align 4, !tbaa !7
  %330 = getelementptr inbounds float, float addrspace(1)* %19, i64 %328
  store float 1.000000e+02, float addrspace(1)* %330, align 4, !tbaa !7
  %331 = getelementptr inbounds float, float addrspace(1)* %23, i64 %328
  store float 1.000000e+02, float addrspace(1)* %331, align 4, !tbaa !7
  %332 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %328
  store i32 0, i32 addrspace(1)* %332, align 4, !tbaa !11
  %333 = add nuw nsw i32 %284, 8
  %334 = add i32 %285, 8
  %335 = icmp eq i32 %334, %282
  br i1 %335, label %389, label %283, !llvm.loop !21

336:                                              ; preds = %336, %273
  %337 = phi i32 [ 0, %273 ], [ %386, %336 ]
  %338 = phi i32 [ 0, %273 ], [ %387, %336 ]
  %339 = zext i32 %337 to i64
  %340 = getelementptr inbounds float, float addrspace(1)* %21, i64 %339
  store float 1.000000e+00, float addrspace(1)* %340, align 4, !tbaa !7
  %341 = getelementptr inbounds float, float addrspace(1)* %19, i64 %339
  store float 1.000000e+02, float addrspace(1)* %341, align 4, !tbaa !7
  %342 = getelementptr inbounds float, float addrspace(1)* %23, i64 %339
  store float 1.000000e+02, float addrspace(1)* %342, align 4, !tbaa !7
  %343 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %339
  store i32 0, i32 addrspace(1)* %343, align 4, !tbaa !11
  %344 = or i32 %337, 1
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds float, float addrspace(1)* %21, i64 %345
  store float 1.000000e+00, float addrspace(1)* %346, align 4, !tbaa !7
  %347 = getelementptr inbounds float, float addrspace(1)* %19, i64 %345
  store float 1.000000e+02, float addrspace(1)* %347, align 4, !tbaa !7
  %348 = getelementptr inbounds float, float addrspace(1)* %23, i64 %345
  store float 1.000000e+02, float addrspace(1)* %348, align 4, !tbaa !7
  %349 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %345
  store i32 0, i32 addrspace(1)* %349, align 4, !tbaa !11
  %350 = or i32 %337, 2
  %351 = zext i32 %350 to i64
  %352 = getelementptr inbounds float, float addrspace(1)* %21, i64 %351
  store float 1.000000e+00, float addrspace(1)* %352, align 4, !tbaa !7
  %353 = getelementptr inbounds float, float addrspace(1)* %19, i64 %351
  store float 1.000000e+02, float addrspace(1)* %353, align 4, !tbaa !7
  %354 = getelementptr inbounds float, float addrspace(1)* %23, i64 %351
  store float 1.000000e+02, float addrspace(1)* %354, align 4, !tbaa !7
  %355 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %351
  store i32 0, i32 addrspace(1)* %355, align 4, !tbaa !11
  %356 = or i32 %337, 3
  %357 = zext i32 %356 to i64
  %358 = getelementptr inbounds float, float addrspace(1)* %21, i64 %357
  store float 1.000000e+00, float addrspace(1)* %358, align 4, !tbaa !7
  %359 = getelementptr inbounds float, float addrspace(1)* %19, i64 %357
  store float 1.000000e+02, float addrspace(1)* %359, align 4, !tbaa !7
  %360 = getelementptr inbounds float, float addrspace(1)* %23, i64 %357
  store float 1.000000e+02, float addrspace(1)* %360, align 4, !tbaa !7
  %361 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %357
  store i32 0, i32 addrspace(1)* %361, align 4, !tbaa !11
  %362 = or i32 %337, 4
  %363 = zext i32 %362 to i64
  %364 = getelementptr inbounds float, float addrspace(1)* %21, i64 %363
  store float 1.000000e+00, float addrspace(1)* %364, align 4, !tbaa !7
  %365 = getelementptr inbounds float, float addrspace(1)* %19, i64 %363
  store float 1.000000e+02, float addrspace(1)* %365, align 4, !tbaa !7
  %366 = getelementptr inbounds float, float addrspace(1)* %23, i64 %363
  store float 1.000000e+02, float addrspace(1)* %366, align 4, !tbaa !7
  %367 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %363
  store i32 0, i32 addrspace(1)* %367, align 4, !tbaa !11
  %368 = or i32 %337, 5
  %369 = zext i32 %368 to i64
  %370 = getelementptr inbounds float, float addrspace(1)* %21, i64 %369
  store float 1.000000e+00, float addrspace(1)* %370, align 4, !tbaa !7
  %371 = getelementptr inbounds float, float addrspace(1)* %19, i64 %369
  store float 1.000000e+02, float addrspace(1)* %371, align 4, !tbaa !7
  %372 = getelementptr inbounds float, float addrspace(1)* %23, i64 %369
  store float 1.000000e+02, float addrspace(1)* %372, align 4, !tbaa !7
  %373 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %369
  store i32 0, i32 addrspace(1)* %373, align 4, !tbaa !11
  %374 = or i32 %337, 6
  %375 = zext i32 %374 to i64
  %376 = getelementptr inbounds float, float addrspace(1)* %21, i64 %375
  store float 1.000000e+00, float addrspace(1)* %376, align 4, !tbaa !7
  %377 = getelementptr inbounds float, float addrspace(1)* %19, i64 %375
  store float 1.000000e+02, float addrspace(1)* %377, align 4, !tbaa !7
  %378 = getelementptr inbounds float, float addrspace(1)* %23, i64 %375
  store float 1.000000e+02, float addrspace(1)* %378, align 4, !tbaa !7
  %379 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %375
  store i32 0, i32 addrspace(1)* %379, align 4, !tbaa !11
  %380 = or i32 %337, 7
  %381 = zext i32 %380 to i64
  %382 = getelementptr inbounds float, float addrspace(1)* %21, i64 %381
  store float 1.000000e+00, float addrspace(1)* %382, align 4, !tbaa !7
  %383 = getelementptr inbounds float, float addrspace(1)* %19, i64 %381
  store float 1.000000e+02, float addrspace(1)* %383, align 4, !tbaa !7
  %384 = getelementptr inbounds float, float addrspace(1)* %23, i64 %381
  store float 1.000000e+02, float addrspace(1)* %384, align 4, !tbaa !7
  %385 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %381
  store i32 0, i32 addrspace(1)* %385, align 4, !tbaa !11
  %386 = add nuw nsw i32 %337, 8
  %387 = add i32 %338, 8
  %388 = icmp eq i32 %387, %274
  br i1 %388, label %403, label %336, !llvm.loop !22

389:                                              ; preds = %283, %275
  %390 = phi i32 [ 0, %275 ], [ %333, %283 ]
  %391 = icmp eq i32 %279, 0
  br i1 %391, label %417, label %392

392:                                              ; preds = %389, %392
  %393 = phi i32 [ %400, %392 ], [ %390, %389 ]
  %394 = phi i32 [ %401, %392 ], [ 0, %389 ]
  %395 = zext i32 %393 to i64
  %396 = getelementptr inbounds float, float addrspace(1)* %21, i64 %395
  store float 1.000000e+00, float addrspace(1)* %396, align 4, !tbaa !7
  %397 = getelementptr inbounds float, float addrspace(1)* %19, i64 %395
  store float 1.000000e+02, float addrspace(1)* %397, align 4, !tbaa !7
  %398 = getelementptr inbounds float, float addrspace(1)* %23, i64 %395
  store float 1.000000e+02, float addrspace(1)* %398, align 4, !tbaa !7
  %399 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %395
  store i32 0, i32 addrspace(1)* %399, align 4, !tbaa !11
  %400 = add nuw nsw i32 %393, 1
  %401 = add i32 %394, 1
  %402 = icmp eq i32 %401, %279
  br i1 %402, label %417, label %392, !llvm.loop !23

403:                                              ; preds = %336, %270
  %404 = phi i32 [ 0, %270 ], [ %386, %336 ]
  %405 = icmp eq i32 %271, 0
  br i1 %405, label %417, label %406

406:                                              ; preds = %403, %406
  %407 = phi i32 [ %414, %406 ], [ %404, %403 ]
  %408 = phi i32 [ %415, %406 ], [ 0, %403 ]
  %409 = zext i32 %407 to i64
  %410 = getelementptr inbounds float, float addrspace(1)* %21, i64 %409
  store float 1.000000e+00, float addrspace(1)* %410, align 4, !tbaa !7
  %411 = getelementptr inbounds float, float addrspace(1)* %19, i64 %409
  store float 1.000000e+02, float addrspace(1)* %411, align 4, !tbaa !7
  %412 = getelementptr inbounds float, float addrspace(1)* %23, i64 %409
  store float 1.000000e+02, float addrspace(1)* %412, align 4, !tbaa !7
  %413 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %409
  store i32 0, i32 addrspace(1)* %413, align 4, !tbaa !11
  %414 = add nuw nsw i32 %407, 1
  %415 = add i32 %408, 1
  %416 = icmp eq i32 %415, %271
  br i1 %416, label %417, label %406, !llvm.loop !24

417:                                              ; preds = %403, %406, %389, %392, %269, %263
  %418 = icmp eq i32 %7, 200
  %419 = icmp slt i32 %15, 501
  %420 = select i1 %418, i1 %419, i1 false
  %421 = icmp sgt i32 %103, 499
  %422 = select i1 %420, i1 %421, i1 false
  br i1 %422, label %423, label %430

423:                                              ; preds = %417
  %424 = sub nsw i32 500, %15
  %425 = zext i32 %424 to i64
  %426 = getelementptr inbounds float, float addrspace(1)* %21, i64 %425
  store float 1.000000e+00, float addrspace(1)* %426, align 4, !tbaa !7
  %427 = getelementptr inbounds float, float addrspace(1)* %19, i64 %425
  store float 1.000000e+02, float addrspace(1)* %427, align 4, !tbaa !7
  %428 = getelementptr inbounds float, float addrspace(1)* %23, i64 %425
  store float 1.000000e+02, float addrspace(1)* %428, align 4, !tbaa !7
  %429 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %425
  store i32 0, i32 addrspace(1)* %429, align 4, !tbaa !11
  br label %430

430:                                              ; preds = %423, %417
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!5 = !{i16 1, i16 1025}
!6 = !{}
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
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !16}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !16}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !16}
!24 = distinct !{!24, !16}
