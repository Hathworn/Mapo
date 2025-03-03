; ModuleID = '../data/hip_kernels/775/0/main.cu'
source_filename = "../data/hip_kernels/775/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@hist = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16histogram_kernelPiS_iS_(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = udiv i32 %14, %11
  %18 = mul i32 %17, %11
  %19 = icmp ugt i32 %14, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %11
  %23 = icmp eq i32 %5, 0
  br i1 %23, label %24, label %27

24:                                               ; preds = %4
  %25 = tail call i64 @llvm.amdgcn.s.memtime()
  %26 = trunc i64 %25 to i32
  br label %27

27:                                               ; preds = %24, %4
  %28 = phi i32 [ %26, %24 ], [ 0, %4 ]
  %29 = shl nuw nsw i32 %5, 6
  %30 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %29
  store i32 0, i32 addrspace(3)* %30, align 4, !tbaa !16
  %31 = add nuw nsw i32 %29, 1
  %32 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %31
  store i32 0, i32 addrspace(3)* %32, align 4, !tbaa !16
  %33 = add nuw nsw i32 %29, 2
  %34 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %33
  store i32 0, i32 addrspace(3)* %34, align 4, !tbaa !16
  %35 = add nuw nsw i32 %29, 3
  %36 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %35
  store i32 0, i32 addrspace(3)* %36, align 4, !tbaa !16
  %37 = add nuw nsw i32 %29, 4
  %38 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %37
  store i32 0, i32 addrspace(3)* %38, align 4, !tbaa !16
  %39 = add nuw nsw i32 %29, 5
  %40 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %39
  store i32 0, i32 addrspace(3)* %40, align 4, !tbaa !16
  %41 = add nuw nsw i32 %29, 6
  %42 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %41
  store i32 0, i32 addrspace(3)* %42, align 4, !tbaa !16
  %43 = add nuw nsw i32 %29, 7
  %44 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %43
  store i32 0, i32 addrspace(3)* %44, align 4, !tbaa !16
  %45 = add nuw nsw i32 %29, 8
  %46 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %45
  store i32 0, i32 addrspace(3)* %46, align 4, !tbaa !16
  %47 = add nuw nsw i32 %29, 9
  %48 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %47
  store i32 0, i32 addrspace(3)* %48, align 4, !tbaa !16
  %49 = add nuw nsw i32 %29, 10
  %50 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %49
  store i32 0, i32 addrspace(3)* %50, align 4, !tbaa !16
  %51 = add nuw nsw i32 %29, 11
  %52 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %51
  store i32 0, i32 addrspace(3)* %52, align 4, !tbaa !16
  %53 = add nuw nsw i32 %29, 12
  %54 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %53
  store i32 0, i32 addrspace(3)* %54, align 4, !tbaa !16
  %55 = add nuw nsw i32 %29, 13
  %56 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %55
  store i32 0, i32 addrspace(3)* %56, align 4, !tbaa !16
  %57 = add nuw nsw i32 %29, 14
  %58 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %57
  store i32 0, i32 addrspace(3)* %58, align 4, !tbaa !16
  %59 = add nuw nsw i32 %29, 15
  %60 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %59
  store i32 0, i32 addrspace(3)* %60, align 4, !tbaa !16
  %61 = add nuw nsw i32 %29, 16
  %62 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %61
  store i32 0, i32 addrspace(3)* %62, align 4, !tbaa !16
  %63 = add nuw nsw i32 %29, 17
  %64 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %63
  store i32 0, i32 addrspace(3)* %64, align 4, !tbaa !16
  %65 = add nuw nsw i32 %29, 18
  %66 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %65
  store i32 0, i32 addrspace(3)* %66, align 4, !tbaa !16
  %67 = add nuw nsw i32 %29, 19
  %68 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %67
  store i32 0, i32 addrspace(3)* %68, align 4, !tbaa !16
  %69 = add nuw nsw i32 %29, 20
  %70 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %69
  store i32 0, i32 addrspace(3)* %70, align 4, !tbaa !16
  %71 = add nuw nsw i32 %29, 21
  %72 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %71
  store i32 0, i32 addrspace(3)* %72, align 4, !tbaa !16
  %73 = add nuw nsw i32 %29, 22
  %74 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %73
  store i32 0, i32 addrspace(3)* %74, align 4, !tbaa !16
  %75 = add nuw nsw i32 %29, 23
  %76 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %75
  store i32 0, i32 addrspace(3)* %76, align 4, !tbaa !16
  %77 = add nuw nsw i32 %29, 24
  %78 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %77
  store i32 0, i32 addrspace(3)* %78, align 4, !tbaa !16
  %79 = add nuw nsw i32 %29, 25
  %80 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %79
  store i32 0, i32 addrspace(3)* %80, align 4, !tbaa !16
  %81 = add nuw nsw i32 %29, 26
  %82 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %81
  store i32 0, i32 addrspace(3)* %82, align 4, !tbaa !16
  %83 = add nuw nsw i32 %29, 27
  %84 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %83
  store i32 0, i32 addrspace(3)* %84, align 4, !tbaa !16
  %85 = add nuw nsw i32 %29, 28
  %86 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %85
  store i32 0, i32 addrspace(3)* %86, align 4, !tbaa !16
  %87 = add nuw nsw i32 %29, 29
  %88 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %87
  store i32 0, i32 addrspace(3)* %88, align 4, !tbaa !16
  %89 = add nuw nsw i32 %29, 30
  %90 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %89
  store i32 0, i32 addrspace(3)* %90, align 4, !tbaa !16
  %91 = add nuw nsw i32 %29, 31
  %92 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %91
  store i32 0, i32 addrspace(3)* %92, align 4, !tbaa !16
  %93 = add nuw nsw i32 %29, 32
  %94 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %93
  store i32 0, i32 addrspace(3)* %94, align 4, !tbaa !16
  %95 = add nuw nsw i32 %29, 33
  %96 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %95
  store i32 0, i32 addrspace(3)* %96, align 4, !tbaa !16
  %97 = add nuw nsw i32 %29, 34
  %98 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %97
  store i32 0, i32 addrspace(3)* %98, align 4, !tbaa !16
  %99 = add nuw nsw i32 %29, 35
  %100 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %99
  store i32 0, i32 addrspace(3)* %100, align 4, !tbaa !16
  %101 = add nuw nsw i32 %29, 36
  %102 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %101
  store i32 0, i32 addrspace(3)* %102, align 4, !tbaa !16
  %103 = add nuw nsw i32 %29, 37
  %104 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %103
  store i32 0, i32 addrspace(3)* %104, align 4, !tbaa !16
  %105 = add nuw nsw i32 %29, 38
  %106 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %105
  store i32 0, i32 addrspace(3)* %106, align 4, !tbaa !16
  %107 = add nuw nsw i32 %29, 39
  %108 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %107
  store i32 0, i32 addrspace(3)* %108, align 4, !tbaa !16
  %109 = add nuw nsw i32 %29, 40
  %110 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %109
  store i32 0, i32 addrspace(3)* %110, align 4, !tbaa !16
  %111 = add nuw nsw i32 %29, 41
  %112 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %111
  store i32 0, i32 addrspace(3)* %112, align 4, !tbaa !16
  %113 = add nuw nsw i32 %29, 42
  %114 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %113
  store i32 0, i32 addrspace(3)* %114, align 4, !tbaa !16
  %115 = add nuw nsw i32 %29, 43
  %116 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %115
  store i32 0, i32 addrspace(3)* %116, align 4, !tbaa !16
  %117 = add nuw nsw i32 %29, 44
  %118 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %117
  store i32 0, i32 addrspace(3)* %118, align 4, !tbaa !16
  %119 = add nuw nsw i32 %29, 45
  %120 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %119
  store i32 0, i32 addrspace(3)* %120, align 4, !tbaa !16
  %121 = add nuw nsw i32 %29, 46
  %122 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %121
  store i32 0, i32 addrspace(3)* %122, align 4, !tbaa !16
  %123 = add nuw nsw i32 %29, 47
  %124 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %123
  store i32 0, i32 addrspace(3)* %124, align 4, !tbaa !16
  %125 = add nuw nsw i32 %29, 48
  %126 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %125
  store i32 0, i32 addrspace(3)* %126, align 4, !tbaa !16
  %127 = add nuw nsw i32 %29, 49
  %128 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %127
  store i32 0, i32 addrspace(3)* %128, align 4, !tbaa !16
  %129 = add nuw nsw i32 %29, 50
  %130 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %129
  store i32 0, i32 addrspace(3)* %130, align 4, !tbaa !16
  %131 = add nuw nsw i32 %29, 51
  %132 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %131
  store i32 0, i32 addrspace(3)* %132, align 4, !tbaa !16
  %133 = add nuw nsw i32 %29, 52
  %134 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %133
  store i32 0, i32 addrspace(3)* %134, align 4, !tbaa !16
  %135 = add nuw nsw i32 %29, 53
  %136 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %135
  store i32 0, i32 addrspace(3)* %136, align 4, !tbaa !16
  %137 = add nuw nsw i32 %29, 54
  %138 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %137
  store i32 0, i32 addrspace(3)* %138, align 4, !tbaa !16
  %139 = add nuw nsw i32 %29, 55
  %140 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %139
  store i32 0, i32 addrspace(3)* %140, align 4, !tbaa !16
  %141 = add nuw nsw i32 %29, 56
  %142 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %141
  store i32 0, i32 addrspace(3)* %142, align 4, !tbaa !16
  %143 = add nuw nsw i32 %29, 57
  %144 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %143
  store i32 0, i32 addrspace(3)* %144, align 4, !tbaa !16
  %145 = add nuw nsw i32 %29, 58
  %146 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %145
  store i32 0, i32 addrspace(3)* %146, align 4, !tbaa !16
  %147 = add nuw nsw i32 %29, 59
  %148 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %147
  store i32 0, i32 addrspace(3)* %148, align 4, !tbaa !16
  %149 = add nuw nsw i32 %29, 60
  %150 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %149
  store i32 0, i32 addrspace(3)* %150, align 4, !tbaa !16
  %151 = add nuw nsw i32 %29, 61
  %152 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %151
  store i32 0, i32 addrspace(3)* %152, align 4, !tbaa !16
  %153 = add nuw nsw i32 %29, 62
  %154 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %153
  store i32 0, i32 addrspace(3)* %154, align 4, !tbaa !16
  %155 = add nuw nsw i32 %29, 63
  %156 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %155
  store i32 0, i32 addrspace(3)* %156, align 4, !tbaa !16
  %157 = add nuw nsw i32 %5, %11
  %158 = icmp slt i32 %16, %2
  br i1 %158, label %164, label %159

159:                                              ; preds = %164, %27
  %160 = and i32 %11, 7
  %161 = icmp ult i16 %10, 8
  br i1 %161, label %175, label %162

162:                                              ; preds = %159
  %163 = and i32 %11, 2040
  br label %209

164:                                              ; preds = %27, %164
  %165 = phi i32 [ %173, %164 ], [ %16, %27 ]
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %166
  %168 = load i32, i32 addrspace(1)* %167, align 4, !tbaa !16
  %169 = add i32 %168, %29
  %170 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %169
  %171 = load i32, i32 addrspace(3)* %170, align 4, !tbaa !16
  %172 = add nsw i32 %171, 1
  store i32 %172, i32 addrspace(3)* %170, align 4, !tbaa !16
  %173 = add i32 %165, %22
  %174 = icmp slt i32 %173, %2
  br i1 %174, label %164, label %159, !llvm.loop !20

175:                                              ; preds = %209, %159
  %176 = phi i32 [ undef, %159 ], [ %288, %209 ]
  %177 = phi i32 [ undef, %159 ], [ %292, %209 ]
  %178 = phi i32 [ 0, %159 ], [ %293, %209 ]
  %179 = phi i32 [ 0, %159 ], [ %288, %209 ]
  %180 = phi i32 [ 0, %159 ], [ %292, %209 ]
  %181 = icmp eq i32 %160, 0
  br i1 %181, label %199, label %182

182:                                              ; preds = %175, %182
  %183 = phi i32 [ %196, %182 ], [ %178, %175 ]
  %184 = phi i32 [ %191, %182 ], [ %179, %175 ]
  %185 = phi i32 [ %195, %182 ], [ %180, %175 ]
  %186 = phi i32 [ %197, %182 ], [ 0, %175 ]
  %187 = shl nsw i32 %183, 6
  %188 = add nuw nsw i32 %187, %5
  %189 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %188
  %190 = load i32, i32 addrspace(3)* %189, align 4, !tbaa !16
  %191 = add nsw i32 %184, %190
  %192 = add nuw nsw i32 %187, %157
  %193 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %192
  %194 = load i32, i32 addrspace(3)* %193, align 4, !tbaa !16
  %195 = add nsw i32 %185, %194
  %196 = add nuw nsw i32 %183, 1
  %197 = add i32 %186, 1
  %198 = icmp eq i32 %197, %160
  br i1 %198, label %199, label %182, !llvm.loop !22

199:                                              ; preds = %182, %175
  %200 = phi i32 [ %176, %175 ], [ %191, %182 ]
  %201 = phi i32 [ %177, %175 ], [ %195, %182 ]
  %202 = shl i32 %6, 6
  %203 = add i32 %202, %5
  %204 = zext i32 %203 to i64
  %205 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %204
  store i32 %200, i32 addrspace(1)* %205, align 4, !tbaa !16
  %206 = add i32 %203, %11
  %207 = zext i32 %206 to i64
  %208 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %207
  store i32 %201, i32 addrspace(1)* %208, align 4, !tbaa !16
  br i1 %23, label %296, label %305

209:                                              ; preds = %209, %162
  %210 = phi i32 [ 0, %162 ], [ %293, %209 ]
  %211 = phi i32 [ 0, %162 ], [ %288, %209 ]
  %212 = phi i32 [ 0, %162 ], [ %292, %209 ]
  %213 = phi i32 [ 0, %162 ], [ %294, %209 ]
  %214 = shl nsw i32 %210, 6
  %215 = add nuw nsw i32 %214, %5
  %216 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %215
  %217 = load i32, i32 addrspace(3)* %216, align 4, !tbaa !16
  %218 = add nsw i32 %211, %217
  %219 = add nuw nsw i32 %214, %157
  %220 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %219
  %221 = load i32, i32 addrspace(3)* %220, align 4, !tbaa !16
  %222 = add nsw i32 %212, %221
  %223 = shl i32 %210, 6
  %224 = or i32 %223, 64
  %225 = add nuw nsw i32 %224, %5
  %226 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %225
  %227 = load i32, i32 addrspace(3)* %226, align 4, !tbaa !16
  %228 = add nsw i32 %218, %227
  %229 = add nuw nsw i32 %224, %157
  %230 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %229
  %231 = load i32, i32 addrspace(3)* %230, align 4, !tbaa !16
  %232 = add nsw i32 %222, %231
  %233 = shl i32 %210, 6
  %234 = or i32 %233, 128
  %235 = add nuw nsw i32 %234, %5
  %236 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %235
  %237 = load i32, i32 addrspace(3)* %236, align 4, !tbaa !16
  %238 = add nsw i32 %228, %237
  %239 = add nuw nsw i32 %234, %157
  %240 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %239
  %241 = load i32, i32 addrspace(3)* %240, align 4, !tbaa !16
  %242 = add nsw i32 %232, %241
  %243 = shl i32 %210, 6
  %244 = or i32 %243, 192
  %245 = add nuw nsw i32 %244, %5
  %246 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %245
  %247 = load i32, i32 addrspace(3)* %246, align 4, !tbaa !16
  %248 = add nsw i32 %238, %247
  %249 = add nuw nsw i32 %244, %157
  %250 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %249
  %251 = load i32, i32 addrspace(3)* %250, align 4, !tbaa !16
  %252 = add nsw i32 %242, %251
  %253 = shl i32 %210, 6
  %254 = or i32 %253, 256
  %255 = add nuw nsw i32 %254, %5
  %256 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %255
  %257 = load i32, i32 addrspace(3)* %256, align 4, !tbaa !16
  %258 = add nsw i32 %248, %257
  %259 = add nuw nsw i32 %254, %157
  %260 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %259
  %261 = load i32, i32 addrspace(3)* %260, align 4, !tbaa !16
  %262 = add nsw i32 %252, %261
  %263 = shl i32 %210, 6
  %264 = or i32 %263, 320
  %265 = add nuw nsw i32 %264, %5
  %266 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %265
  %267 = load i32, i32 addrspace(3)* %266, align 4, !tbaa !16
  %268 = add nsw i32 %258, %267
  %269 = add nuw nsw i32 %264, %157
  %270 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %269
  %271 = load i32, i32 addrspace(3)* %270, align 4, !tbaa !16
  %272 = add nsw i32 %262, %271
  %273 = shl i32 %210, 6
  %274 = or i32 %273, 384
  %275 = add nuw nsw i32 %274, %5
  %276 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %275
  %277 = load i32, i32 addrspace(3)* %276, align 4, !tbaa !16
  %278 = add nsw i32 %268, %277
  %279 = add nuw nsw i32 %274, %157
  %280 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %279
  %281 = load i32, i32 addrspace(3)* %280, align 4, !tbaa !16
  %282 = add nsw i32 %272, %281
  %283 = shl i32 %210, 6
  %284 = or i32 %283, 448
  %285 = add nuw nsw i32 %284, %5
  %286 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %285
  %287 = load i32, i32 addrspace(3)* %286, align 4, !tbaa !16
  %288 = add nsw i32 %278, %287
  %289 = add nuw nsw i32 %284, %157
  %290 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %289
  %291 = load i32, i32 addrspace(3)* %290, align 4, !tbaa !16
  %292 = add nsw i32 %282, %291
  %293 = add nuw nsw i32 %210, 8
  %294 = add i32 %213, 8
  %295 = icmp eq i32 %294, %163
  br i1 %295, label %175, label %209, !llvm.loop !24

296:                                              ; preds = %199
  %297 = tail call i64 @llvm.amdgcn.s.memtime()
  %298 = shl i32 %6, 1
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %299
  store i32 %28, i32 addrspace(1)* %300, align 4, !tbaa !16
  %301 = trunc i64 %297 to i32
  %302 = add nuw nsw i32 %298, 1
  %303 = zext i32 %302 to i64
  %304 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %303
  store i32 %301, i32 addrspace(1)* %304, align 4, !tbaa !16
  br label %305

305:                                              ; preds = %296, %199
  ret void
}

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memtime() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
