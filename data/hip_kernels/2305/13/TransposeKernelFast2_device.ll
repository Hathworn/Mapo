; ModuleID = '../data/hip_kernels/2305/13/main.cu'
source_filename = "../data/hip_kernels/2305/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20TransposeKernelFast2PKhPhiiE4sbuf = internal unnamed_addr addrspace(3) global [32 x [36 x i8]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20TransposeKernelFast2PKhPhii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = shl i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 5
  %11 = add nsw i32 %8, %5
  %12 = icmp slt i32 %11, %2
  br i1 %12, label %13, label %112

13:                                               ; preds = %4
  %14 = add nsw i32 %10, 32
  %15 = tail call i32 @llvm.smin.i32(i32 %14, i32 %3)
  %16 = add nsw i32 %10, %6
  %17 = icmp slt i32 %16, %15
  br i1 %17, label %18, label %112

18:                                               ; preds = %13
  %19 = add i32 %6, %10
  %20 = add i32 %19, 8
  %21 = tail call i32 @llvm.smax.i32(i32 %15, i32 %20)
  %22 = xor i32 %6, -1
  %23 = add i32 %21, %22
  %24 = sub i32 %23, %10
  %25 = lshr i32 %24, 3
  %26 = add nuw nsw i32 %25, 1
  %27 = icmp ult i32 %24, 216
  br i1 %27, label %97, label %28

28:                                               ; preds = %18
  %29 = add i32 %6, %10
  %30 = add i32 %29, 8
  %31 = tail call i32 @llvm.smax.i32(i32 %15, i32 %30)
  %32 = xor i32 %6, -1
  %33 = add i32 %31, %32
  %34 = sub i32 %33, %10
  %35 = lshr i32 %34, 3
  %36 = shl i32 %2, 3
  %37 = mul i32 %2, -8
  %38 = mul i32 %16, %2
  %39 = add i32 %5, %38
  %40 = add i32 %39, %8
  %41 = icmp slt i32 %36, 0
  %42 = select i1 %41, i32 %37, i32 %36
  %43 = tail call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %42, i32 %35)
  %44 = extractvalue { i32, i1 } %43, 0
  %45 = extractvalue { i32, i1 } %43, 1
  %46 = add i32 %40, %44
  %47 = sub i32 %40, %44
  %48 = icmp slt i32 %46, %40
  %49 = icmp sgt i32 %47, %40
  %50 = select i1 %41, i1 %49, i1 %48
  %51 = or i1 %50, %45
  br i1 %51, label %97, label %52

52:                                               ; preds = %28
  %53 = and i32 %26, -4
  %54 = shl i32 %53, 3
  %55 = add i32 %6, %54
  %56 = shl i32 %53, 3
  %57 = add i32 %16, %56
  %58 = insertelement <4 x i32> poison, i32 %16, i64 0
  %59 = shufflevector <4 x i32> %58, <4 x i32> poison, <4 x i32> zeroinitializer
  %60 = add <4 x i32> %59, <i32 0, i32 8, i32 16, i32 24>
  %61 = insertelement <4 x i32> poison, i32 %2, i64 0
  %62 = shufflevector <4 x i32> %61, <4 x i32> poison, <4 x i32> zeroinitializer
  %63 = insertelement <4 x i32> poison, i32 %11, i64 0
  %64 = shufflevector <4 x i32> %63, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %65

65:                                               ; preds = %65, %52
  %66 = phi i32 [ 0, %52 ], [ %92, %65 ]
  %67 = phi <4 x i32> [ %60, %52 ], [ %93, %65 ]
  %68 = shl i32 %66, 3
  %69 = add i32 %6, %68
  %70 = add i32 %69, 8
  %71 = add i32 %69, 16
  %72 = add i32 %69, 24
  %73 = mul nsw <4 x i32> %67, %62
  %74 = add nsw <4 x i32> %73, %64
  %75 = sext <4 x i32> %74 to <4 x i64>
  %76 = extractelement <4 x i64> %75, i64 0
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %76
  %78 = extractelement <4 x i64> %75, i64 1
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %78
  %80 = extractelement <4 x i64> %75, i64 2
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %80
  %82 = extractelement <4 x i64> %75, i64 3
  %83 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %82
  %84 = load i8, i8 addrspace(1)* %77, align 1, !tbaa !5, !amdgpu.noclobber !8
  %85 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !5, !amdgpu.noclobber !8
  %86 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !5, !amdgpu.noclobber !8
  %87 = load i8, i8 addrspace(1)* %83, align 1, !tbaa !5, !amdgpu.noclobber !8
  %88 = getelementptr inbounds [32 x [36 x i8]], [32 x [36 x i8]] addrspace(3)* @_ZZ20TransposeKernelFast2PKhPhiiE4sbuf, i32 0, i32 %69, i32 %5
  %89 = getelementptr inbounds [32 x [36 x i8]], [32 x [36 x i8]] addrspace(3)* @_ZZ20TransposeKernelFast2PKhPhiiE4sbuf, i32 0, i32 %70, i32 %5
  %90 = getelementptr inbounds [32 x [36 x i8]], [32 x [36 x i8]] addrspace(3)* @_ZZ20TransposeKernelFast2PKhPhiiE4sbuf, i32 0, i32 %71, i32 %5
  %91 = getelementptr inbounds [32 x [36 x i8]], [32 x [36 x i8]] addrspace(3)* @_ZZ20TransposeKernelFast2PKhPhiiE4sbuf, i32 0, i32 %72, i32 %5
  store i8 %84, i8 addrspace(3)* %88, align 1, !tbaa !5
  store i8 %85, i8 addrspace(3)* %89, align 1, !tbaa !5
  store i8 %86, i8 addrspace(3)* %90, align 1, !tbaa !5
  store i8 %87, i8 addrspace(3)* %91, align 1, !tbaa !5
  %92 = add nuw i32 %66, 4
  %93 = add <4 x i32> %67, <i32 32, i32 32, i32 32, i32 32>
  %94 = icmp eq i32 %92, %53
  br i1 %94, label %95, label %65, !llvm.loop !9

95:                                               ; preds = %65
  %96 = icmp eq i32 %26, %53
  br i1 %96, label %112, label %97

97:                                               ; preds = %28, %18, %95
  %98 = phi i32 [ %6, %28 ], [ %6, %18 ], [ %55, %95 ]
  %99 = phi i32 [ %16, %28 ], [ %16, %18 ], [ %57, %95 ]
  br label %100

100:                                              ; preds = %97, %100
  %101 = phi i32 [ %109, %100 ], [ %98, %97 ]
  %102 = phi i32 [ %110, %100 ], [ %99, %97 ]
  %103 = mul nsw i32 %102, %2
  %104 = add nsw i32 %103, %11
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %105
  %107 = load i8, i8 addrspace(1)* %106, align 1, !tbaa !5, !amdgpu.noclobber !8
  %108 = getelementptr inbounds [32 x [36 x i8]], [32 x [36 x i8]] addrspace(3)* @_ZZ20TransposeKernelFast2PKhPhiiE4sbuf, i32 0, i32 %101, i32 %5
  store i8 %107, i8 addrspace(3)* %108, align 1, !tbaa !5
  %109 = add nuw nsw i32 %101, 8
  %110 = add nsw i32 %102, 8
  %111 = icmp slt i32 %110, %15
  br i1 %111, label %100, label %112, !llvm.loop !12

112:                                              ; preds = %100, %95, %13, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %113 = add nsw i32 %10, %5
  %114 = icmp slt i32 %113, %3
  br i1 %114, label %115, label %214

115:                                              ; preds = %112
  %116 = add nsw i32 %8, 32
  %117 = tail call i32 @llvm.smin.i32(i32 %116, i32 %2)
  %118 = add nsw i32 %8, %6
  %119 = icmp slt i32 %118, %117
  br i1 %119, label %120, label %214

120:                                              ; preds = %115
  %121 = add i32 %6, %8
  %122 = add i32 %121, 8
  %123 = tail call i32 @llvm.smax.i32(i32 %117, i32 %122)
  %124 = xor i32 %6, -1
  %125 = add i32 %123, %124
  %126 = sub i32 %125, %8
  %127 = lshr i32 %126, 3
  %128 = add nuw nsw i32 %127, 1
  %129 = icmp ult i32 %126, 216
  br i1 %129, label %199, label %130

130:                                              ; preds = %120
  %131 = add i32 %6, %8
  %132 = add i32 %131, 8
  %133 = tail call i32 @llvm.smax.i32(i32 %117, i32 %132)
  %134 = xor i32 %6, -1
  %135 = add i32 %133, %134
  %136 = sub i32 %135, %8
  %137 = lshr i32 %136, 3
  %138 = shl i32 %3, 3
  %139 = mul i32 %3, -8
  %140 = mul i32 %118, %3
  %141 = add i32 %5, %140
  %142 = add i32 %141, %10
  %143 = icmp slt i32 %138, 0
  %144 = select i1 %143, i32 %139, i32 %138
  %145 = tail call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %144, i32 %137)
  %146 = extractvalue { i32, i1 } %145, 0
  %147 = extractvalue { i32, i1 } %145, 1
  %148 = add i32 %142, %146
  %149 = sub i32 %142, %146
  %150 = icmp slt i32 %148, %142
  %151 = icmp sgt i32 %149, %142
  %152 = select i1 %143, i1 %151, i1 %150
  %153 = or i1 %152, %147
  br i1 %153, label %199, label %154

154:                                              ; preds = %130
  %155 = and i32 %128, -4
  %156 = shl i32 %155, 3
  %157 = add i32 %118, %156
  %158 = shl i32 %155, 3
  %159 = add i32 %6, %158
  %160 = insertelement <4 x i32> poison, i32 %118, i64 0
  %161 = shufflevector <4 x i32> %160, <4 x i32> poison, <4 x i32> zeroinitializer
  %162 = add <4 x i32> %161, <i32 0, i32 8, i32 16, i32 24>
  %163 = insertelement <4 x i32> poison, i32 %3, i64 0
  %164 = shufflevector <4 x i32> %163, <4 x i32> poison, <4 x i32> zeroinitializer
  %165 = insertelement <4 x i32> poison, i32 %113, i64 0
  %166 = shufflevector <4 x i32> %165, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %167

167:                                              ; preds = %167, %154
  %168 = phi i32 [ 0, %154 ], [ %194, %167 ]
  %169 = phi <4 x i32> [ %162, %154 ], [ %195, %167 ]
  %170 = shl i32 %168, 3
  %171 = add i32 %6, %170
  %172 = add i32 %171, 8
  %173 = add i32 %171, 16
  %174 = add i32 %171, 24
  %175 = getelementptr inbounds [32 x [36 x i8]], [32 x [36 x i8]] addrspace(3)* @_ZZ20TransposeKernelFast2PKhPhiiE4sbuf, i32 0, i32 %5, i32 %171
  %176 = getelementptr inbounds [32 x [36 x i8]], [32 x [36 x i8]] addrspace(3)* @_ZZ20TransposeKernelFast2PKhPhiiE4sbuf, i32 0, i32 %5, i32 %172
  %177 = getelementptr inbounds [32 x [36 x i8]], [32 x [36 x i8]] addrspace(3)* @_ZZ20TransposeKernelFast2PKhPhiiE4sbuf, i32 0, i32 %5, i32 %173
  %178 = getelementptr inbounds [32 x [36 x i8]], [32 x [36 x i8]] addrspace(3)* @_ZZ20TransposeKernelFast2PKhPhiiE4sbuf, i32 0, i32 %5, i32 %174
  %179 = load i8, i8 addrspace(3)* %175, align 1, !tbaa !5
  %180 = load i8, i8 addrspace(3)* %176, align 1, !tbaa !5
  %181 = load i8, i8 addrspace(3)* %177, align 1, !tbaa !5
  %182 = load i8, i8 addrspace(3)* %178, align 1, !tbaa !5
  %183 = mul nsw <4 x i32> %169, %164
  %184 = add nsw <4 x i32> %183, %166
  %185 = sext <4 x i32> %184 to <4 x i64>
  %186 = extractelement <4 x i64> %185, i64 0
  %187 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %186
  %188 = extractelement <4 x i64> %185, i64 1
  %189 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %188
  %190 = extractelement <4 x i64> %185, i64 2
  %191 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %190
  %192 = extractelement <4 x i64> %185, i64 3
  %193 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %192
  store i8 %179, i8 addrspace(1)* %187, align 1, !tbaa !5
  store i8 %180, i8 addrspace(1)* %189, align 1, !tbaa !5
  store i8 %181, i8 addrspace(1)* %191, align 1, !tbaa !5
  store i8 %182, i8 addrspace(1)* %193, align 1, !tbaa !5
  %194 = add nuw i32 %168, 4
  %195 = add <4 x i32> %169, <i32 32, i32 32, i32 32, i32 32>
  %196 = icmp eq i32 %194, %155
  br i1 %196, label %197, label %167, !llvm.loop !13

197:                                              ; preds = %167
  %198 = icmp eq i32 %128, %155
  br i1 %198, label %214, label %199

199:                                              ; preds = %130, %120, %197
  %200 = phi i32 [ %118, %130 ], [ %118, %120 ], [ %157, %197 ]
  %201 = phi i32 [ %6, %130 ], [ %6, %120 ], [ %159, %197 ]
  br label %202

202:                                              ; preds = %199, %202
  %203 = phi i32 [ %212, %202 ], [ %200, %199 ]
  %204 = phi i32 [ %211, %202 ], [ %201, %199 ]
  %205 = getelementptr inbounds [32 x [36 x i8]], [32 x [36 x i8]] addrspace(3)* @_ZZ20TransposeKernelFast2PKhPhiiE4sbuf, i32 0, i32 %5, i32 %204
  %206 = load i8, i8 addrspace(3)* %205, align 1, !tbaa !5
  %207 = mul nsw i32 %203, %3
  %208 = add nsw i32 %207, %113
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %209
  store i8 %206, i8 addrspace(1)* %210, align 1, !tbaa !5
  %211 = add nuw nsw i32 %204, 8
  %212 = add nsw i32 %203, 8
  %213 = icmp slt i32 %212, %117
  br i1 %213, label %202, label %214, !llvm.loop !14

214:                                              ; preds = %202, %197, %115, %112
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.umul.with.overflow.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = distinct !{!13, !10, !11}
!14 = distinct !{!14, !10, !11}
