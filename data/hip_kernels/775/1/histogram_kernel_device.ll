; ModuleID = '../data/hip_kernels/775/1/main.cu'
source_filename = "../data/hip_kernels/775/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@hist = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16histogram_kernelPiS_iS_(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
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
  br i1 %23, label %24, label %26

24:                                               ; preds = %4
  %25 = tail call i64 @llvm.amdgcn.s.memtime()
  br label %26

26:                                               ; preds = %24, %4
  %27 = phi i64 [ %25, %24 ], [ 0, %4 ]
  %28 = shl nuw nsw i32 %5, 6
  %29 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %28
  store i32 0, i32 addrspace(3)* %29, align 4, !tbaa !16
  %30 = add nuw nsw i32 %28, 1
  %31 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %30
  store i32 0, i32 addrspace(3)* %31, align 4, !tbaa !16
  %32 = add nuw nsw i32 %28, 2
  %33 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %32
  store i32 0, i32 addrspace(3)* %33, align 4, !tbaa !16
  %34 = add nuw nsw i32 %28, 3
  %35 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %34
  store i32 0, i32 addrspace(3)* %35, align 4, !tbaa !16
  %36 = add nuw nsw i32 %28, 4
  %37 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %36
  store i32 0, i32 addrspace(3)* %37, align 4, !tbaa !16
  %38 = add nuw nsw i32 %28, 5
  %39 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %38
  store i32 0, i32 addrspace(3)* %39, align 4, !tbaa !16
  %40 = add nuw nsw i32 %28, 6
  %41 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %40
  store i32 0, i32 addrspace(3)* %41, align 4, !tbaa !16
  %42 = add nuw nsw i32 %28, 7
  %43 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %42
  store i32 0, i32 addrspace(3)* %43, align 4, !tbaa !16
  %44 = add nuw nsw i32 %28, 8
  %45 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %44
  store i32 0, i32 addrspace(3)* %45, align 4, !tbaa !16
  %46 = add nuw nsw i32 %28, 9
  %47 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %46
  store i32 0, i32 addrspace(3)* %47, align 4, !tbaa !16
  %48 = add nuw nsw i32 %28, 10
  %49 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %48
  store i32 0, i32 addrspace(3)* %49, align 4, !tbaa !16
  %50 = add nuw nsw i32 %28, 11
  %51 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %50
  store i32 0, i32 addrspace(3)* %51, align 4, !tbaa !16
  %52 = add nuw nsw i32 %28, 12
  %53 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %52
  store i32 0, i32 addrspace(3)* %53, align 4, !tbaa !16
  %54 = add nuw nsw i32 %28, 13
  %55 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %54
  store i32 0, i32 addrspace(3)* %55, align 4, !tbaa !16
  %56 = add nuw nsw i32 %28, 14
  %57 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %56
  store i32 0, i32 addrspace(3)* %57, align 4, !tbaa !16
  %58 = add nuw nsw i32 %28, 15
  %59 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %58
  store i32 0, i32 addrspace(3)* %59, align 4, !tbaa !16
  %60 = add nuw nsw i32 %28, 16
  %61 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %60
  store i32 0, i32 addrspace(3)* %61, align 4, !tbaa !16
  %62 = add nuw nsw i32 %28, 17
  %63 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %62
  store i32 0, i32 addrspace(3)* %63, align 4, !tbaa !16
  %64 = add nuw nsw i32 %28, 18
  %65 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %64
  store i32 0, i32 addrspace(3)* %65, align 4, !tbaa !16
  %66 = add nuw nsw i32 %28, 19
  %67 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %66
  store i32 0, i32 addrspace(3)* %67, align 4, !tbaa !16
  %68 = add nuw nsw i32 %28, 20
  %69 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %68
  store i32 0, i32 addrspace(3)* %69, align 4, !tbaa !16
  %70 = add nuw nsw i32 %28, 21
  %71 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %70
  store i32 0, i32 addrspace(3)* %71, align 4, !tbaa !16
  %72 = add nuw nsw i32 %28, 22
  %73 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %72
  store i32 0, i32 addrspace(3)* %73, align 4, !tbaa !16
  %74 = add nuw nsw i32 %28, 23
  %75 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %74
  store i32 0, i32 addrspace(3)* %75, align 4, !tbaa !16
  %76 = add nuw nsw i32 %28, 24
  %77 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %76
  store i32 0, i32 addrspace(3)* %77, align 4, !tbaa !16
  %78 = add nuw nsw i32 %28, 25
  %79 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %78
  store i32 0, i32 addrspace(3)* %79, align 4, !tbaa !16
  %80 = add nuw nsw i32 %28, 26
  %81 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %80
  store i32 0, i32 addrspace(3)* %81, align 4, !tbaa !16
  %82 = add nuw nsw i32 %28, 27
  %83 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %82
  store i32 0, i32 addrspace(3)* %83, align 4, !tbaa !16
  %84 = add nuw nsw i32 %28, 28
  %85 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %84
  store i32 0, i32 addrspace(3)* %85, align 4, !tbaa !16
  %86 = add nuw nsw i32 %28, 29
  %87 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %86
  store i32 0, i32 addrspace(3)* %87, align 4, !tbaa !16
  %88 = add nuw nsw i32 %28, 30
  %89 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %88
  store i32 0, i32 addrspace(3)* %89, align 4, !tbaa !16
  %90 = add nuw nsw i32 %28, 31
  %91 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %90
  store i32 0, i32 addrspace(3)* %91, align 4, !tbaa !16
  %92 = add nuw nsw i32 %28, 32
  %93 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %92
  store i32 0, i32 addrspace(3)* %93, align 4, !tbaa !16
  %94 = add nuw nsw i32 %28, 33
  %95 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %94
  store i32 0, i32 addrspace(3)* %95, align 4, !tbaa !16
  %96 = add nuw nsw i32 %28, 34
  %97 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %96
  store i32 0, i32 addrspace(3)* %97, align 4, !tbaa !16
  %98 = add nuw nsw i32 %28, 35
  %99 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %98
  store i32 0, i32 addrspace(3)* %99, align 4, !tbaa !16
  %100 = add nuw nsw i32 %28, 36
  %101 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %100
  store i32 0, i32 addrspace(3)* %101, align 4, !tbaa !16
  %102 = add nuw nsw i32 %28, 37
  %103 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %102
  store i32 0, i32 addrspace(3)* %103, align 4, !tbaa !16
  %104 = add nuw nsw i32 %28, 38
  %105 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %104
  store i32 0, i32 addrspace(3)* %105, align 4, !tbaa !16
  %106 = add nuw nsw i32 %28, 39
  %107 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %106
  store i32 0, i32 addrspace(3)* %107, align 4, !tbaa !16
  %108 = add nuw nsw i32 %28, 40
  %109 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %108
  store i32 0, i32 addrspace(3)* %109, align 4, !tbaa !16
  %110 = add nuw nsw i32 %28, 41
  %111 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %110
  store i32 0, i32 addrspace(3)* %111, align 4, !tbaa !16
  %112 = add nuw nsw i32 %28, 42
  %113 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %112
  store i32 0, i32 addrspace(3)* %113, align 4, !tbaa !16
  %114 = add nuw nsw i32 %28, 43
  %115 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %114
  store i32 0, i32 addrspace(3)* %115, align 4, !tbaa !16
  %116 = add nuw nsw i32 %28, 44
  %117 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %116
  store i32 0, i32 addrspace(3)* %117, align 4, !tbaa !16
  %118 = add nuw nsw i32 %28, 45
  %119 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %118
  store i32 0, i32 addrspace(3)* %119, align 4, !tbaa !16
  %120 = add nuw nsw i32 %28, 46
  %121 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %120
  store i32 0, i32 addrspace(3)* %121, align 4, !tbaa !16
  %122 = add nuw nsw i32 %28, 47
  %123 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %122
  store i32 0, i32 addrspace(3)* %123, align 4, !tbaa !16
  %124 = add nuw nsw i32 %28, 48
  %125 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %124
  store i32 0, i32 addrspace(3)* %125, align 4, !tbaa !16
  %126 = add nuw nsw i32 %28, 49
  %127 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %126
  store i32 0, i32 addrspace(3)* %127, align 4, !tbaa !16
  %128 = add nuw nsw i32 %28, 50
  %129 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %128
  store i32 0, i32 addrspace(3)* %129, align 4, !tbaa !16
  %130 = add nuw nsw i32 %28, 51
  %131 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %130
  store i32 0, i32 addrspace(3)* %131, align 4, !tbaa !16
  %132 = add nuw nsw i32 %28, 52
  %133 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %132
  store i32 0, i32 addrspace(3)* %133, align 4, !tbaa !16
  %134 = add nuw nsw i32 %28, 53
  %135 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %134
  store i32 0, i32 addrspace(3)* %135, align 4, !tbaa !16
  %136 = add nuw nsw i32 %28, 54
  %137 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %136
  store i32 0, i32 addrspace(3)* %137, align 4, !tbaa !16
  %138 = add nuw nsw i32 %28, 55
  %139 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %138
  store i32 0, i32 addrspace(3)* %139, align 4, !tbaa !16
  %140 = add nuw nsw i32 %28, 56
  %141 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %140
  store i32 0, i32 addrspace(3)* %141, align 4, !tbaa !16
  %142 = add nuw nsw i32 %28, 57
  %143 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %142
  store i32 0, i32 addrspace(3)* %143, align 4, !tbaa !16
  %144 = add nuw nsw i32 %28, 58
  %145 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %144
  store i32 0, i32 addrspace(3)* %145, align 4, !tbaa !16
  %146 = add nuw nsw i32 %28, 59
  %147 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %146
  store i32 0, i32 addrspace(3)* %147, align 4, !tbaa !16
  %148 = add nuw nsw i32 %28, 60
  %149 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %148
  store i32 0, i32 addrspace(3)* %149, align 4, !tbaa !16
  %150 = add nuw nsw i32 %28, 61
  %151 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %150
  store i32 0, i32 addrspace(3)* %151, align 4, !tbaa !16
  %152 = add nuw nsw i32 %28, 62
  %153 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %152
  store i32 0, i32 addrspace(3)* %153, align 4, !tbaa !16
  %154 = add nuw nsw i32 %28, 63
  %155 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %154
  store i32 0, i32 addrspace(3)* %155, align 4, !tbaa !16
  %156 = icmp slt i32 %16, %2
  br i1 %156, label %167, label %157

157:                                              ; preds = %167, %26
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %158 = zext i32 %5 to i64
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %158
  %160 = add nuw nsw i32 %5, %11
  %161 = zext i32 %160 to i64
  %162 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %161
  %163 = and i32 %11, 7
  %164 = icmp ult i16 %10, 8
  br i1 %164, label %178, label %165

165:                                              ; preds = %157
  %166 = and i32 %11, 2040
  br label %198

167:                                              ; preds = %26, %167
  %168 = phi i32 [ %176, %167 ], [ %16, %26 ]
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %169
  %171 = load i32, i32 addrspace(1)* %170, align 4, !tbaa !16
  %172 = add nsw i32 %171, %28
  %173 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %172
  %174 = load i32, i32 addrspace(3)* %173, align 4, !tbaa !16
  %175 = add nsw i32 %174, 1
  store i32 %175, i32 addrspace(3)* %173, align 4, !tbaa !16
  %176 = add nsw i32 %168, %22
  %177 = icmp slt i32 %176, %2
  br i1 %177, label %167, label %157, !llvm.loop !20

178:                                              ; preds = %198, %157
  %179 = phi i32 [ 0, %157 ], [ %280, %198 ]
  %180 = icmp eq i32 %163, 0
  br i1 %180, label %196, label %181

181:                                              ; preds = %178, %181
  %182 = phi i32 [ %193, %181 ], [ %179, %178 ]
  %183 = phi i32 [ %194, %181 ], [ 0, %178 ]
  %184 = shl nsw i32 %182, 6
  %185 = add nuw nsw i32 %184, %5
  %186 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %185
  %187 = load i32, i32 addrspace(3)* %186, align 4, !tbaa !16
  %188 = atomicrmw add i32 addrspace(1)* %159, i32 %187 syncscope("agent-one-as") monotonic, align 4
  %189 = add nuw i32 %185, %11
  %190 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %189
  %191 = load i32, i32 addrspace(3)* %190, align 4, !tbaa !16
  %192 = atomicrmw add i32 addrspace(1)* %162, i32 %191 syncscope("agent-one-as") monotonic, align 4
  %193 = add nuw nsw i32 %182, 1
  %194 = add i32 %183, 1
  %195 = icmp eq i32 %194, %163
  br i1 %195, label %196, label %181, !llvm.loop !22

196:                                              ; preds = %181, %178
  %197 = tail call i64 @llvm.amdgcn.s.memtime()
  br i1 %23, label %283, label %288

198:                                              ; preds = %198, %165
  %199 = phi i32 [ 0, %165 ], [ %280, %198 ]
  %200 = phi i32 [ 0, %165 ], [ %281, %198 ]
  %201 = shl nsw i32 %199, 6
  %202 = add nuw nsw i32 %201, %5
  %203 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %202
  %204 = load i32, i32 addrspace(3)* %203, align 4, !tbaa !16
  %205 = atomicrmw add i32 addrspace(1)* %159, i32 %204 syncscope("agent-one-as") monotonic, align 4
  %206 = add nuw i32 %202, %11
  %207 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %206
  %208 = load i32, i32 addrspace(3)* %207, align 4, !tbaa !16
  %209 = atomicrmw add i32 addrspace(1)* %162, i32 %208 syncscope("agent-one-as") monotonic, align 4
  %210 = shl i32 %199, 6
  %211 = or i32 %210, 64
  %212 = add nuw nsw i32 %211, %5
  %213 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %212
  %214 = load i32, i32 addrspace(3)* %213, align 4, !tbaa !16
  %215 = atomicrmw add i32 addrspace(1)* %159, i32 %214 syncscope("agent-one-as") monotonic, align 4
  %216 = add nuw i32 %212, %11
  %217 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %216
  %218 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !16
  %219 = atomicrmw add i32 addrspace(1)* %162, i32 %218 syncscope("agent-one-as") monotonic, align 4
  %220 = shl i32 %199, 6
  %221 = or i32 %220, 128
  %222 = add nuw nsw i32 %221, %5
  %223 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %222
  %224 = load i32, i32 addrspace(3)* %223, align 4, !tbaa !16
  %225 = atomicrmw add i32 addrspace(1)* %159, i32 %224 syncscope("agent-one-as") monotonic, align 4
  %226 = add nuw i32 %222, %11
  %227 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %226
  %228 = load i32, i32 addrspace(3)* %227, align 4, !tbaa !16
  %229 = atomicrmw add i32 addrspace(1)* %162, i32 %228 syncscope("agent-one-as") monotonic, align 4
  %230 = shl i32 %199, 6
  %231 = or i32 %230, 192
  %232 = add nuw nsw i32 %231, %5
  %233 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %232
  %234 = load i32, i32 addrspace(3)* %233, align 4, !tbaa !16
  %235 = atomicrmw add i32 addrspace(1)* %159, i32 %234 syncscope("agent-one-as") monotonic, align 4
  %236 = add nuw i32 %232, %11
  %237 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %236
  %238 = load i32, i32 addrspace(3)* %237, align 4, !tbaa !16
  %239 = atomicrmw add i32 addrspace(1)* %162, i32 %238 syncscope("agent-one-as") monotonic, align 4
  %240 = shl i32 %199, 6
  %241 = or i32 %240, 256
  %242 = add nuw nsw i32 %241, %5
  %243 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %242
  %244 = load i32, i32 addrspace(3)* %243, align 4, !tbaa !16
  %245 = atomicrmw add i32 addrspace(1)* %159, i32 %244 syncscope("agent-one-as") monotonic, align 4
  %246 = add nuw i32 %242, %11
  %247 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %246
  %248 = load i32, i32 addrspace(3)* %247, align 4, !tbaa !16
  %249 = atomicrmw add i32 addrspace(1)* %162, i32 %248 syncscope("agent-one-as") monotonic, align 4
  %250 = shl i32 %199, 6
  %251 = or i32 %250, 320
  %252 = add nuw nsw i32 %251, %5
  %253 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %252
  %254 = load i32, i32 addrspace(3)* %253, align 4, !tbaa !16
  %255 = atomicrmw add i32 addrspace(1)* %159, i32 %254 syncscope("agent-one-as") monotonic, align 4
  %256 = add nuw i32 %252, %11
  %257 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %256
  %258 = load i32, i32 addrspace(3)* %257, align 4, !tbaa !16
  %259 = atomicrmw add i32 addrspace(1)* %162, i32 %258 syncscope("agent-one-as") monotonic, align 4
  %260 = shl i32 %199, 6
  %261 = or i32 %260, 384
  %262 = add nuw nsw i32 %261, %5
  %263 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %262
  %264 = load i32, i32 addrspace(3)* %263, align 4, !tbaa !16
  %265 = atomicrmw add i32 addrspace(1)* %159, i32 %264 syncscope("agent-one-as") monotonic, align 4
  %266 = add nuw i32 %262, %11
  %267 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %266
  %268 = load i32, i32 addrspace(3)* %267, align 4, !tbaa !16
  %269 = atomicrmw add i32 addrspace(1)* %162, i32 %268 syncscope("agent-one-as") monotonic, align 4
  %270 = shl i32 %199, 6
  %271 = or i32 %270, 448
  %272 = add nuw nsw i32 %271, %5
  %273 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %272
  %274 = load i32, i32 addrspace(3)* %273, align 4, !tbaa !16
  %275 = atomicrmw add i32 addrspace(1)* %159, i32 %274 syncscope("agent-one-as") monotonic, align 4
  %276 = add nuw i32 %272, %11
  %277 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hist, i32 0, i32 %276
  %278 = load i32, i32 addrspace(3)* %277, align 4, !tbaa !16
  %279 = atomicrmw add i32 addrspace(1)* %162, i32 %278 syncscope("agent-one-as") monotonic, align 4
  %280 = add nuw nsw i32 %199, 8
  %281 = add i32 %200, 8
  %282 = icmp eq i32 %281, %166
  br i1 %282, label %178, label %198, !llvm.loop !24

283:                                              ; preds = %196
  %284 = sub nsw i64 %197, %27
  %285 = trunc i64 %284 to i32
  %286 = zext i32 %6 to i64
  %287 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %286
  store i32 %285, i32 addrspace(1)* %287, align 4, !tbaa !16
  br label %288

288:                                              ; preds = %283, %196
  ret void
}

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memtime() #1

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nounwind willreturn }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
