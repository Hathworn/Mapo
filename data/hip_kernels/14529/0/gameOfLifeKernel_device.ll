; ModuleID = '../data/hip_kernels/14529/0/main.cu'
source_filename = "../data/hip_kernels/14529/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@board_sh = external hidden local_unnamed_addr addrspace(3) global [0 x i8], align 1

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16gameOfLifeKernelPhS_mm(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i64 %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = bitcast i8 addrspace(4)* %7 to <2 x i16> addrspace(4)*
  %12 = load <2 x i16>, <2 x i16> addrspace(4)* %11, align 4, !invariant.load !5
  %13 = zext <2 x i16> %12 to <2 x i32>
  %14 = extractelement <2 x i32> %13, i64 0
  %15 = mul i32 %6, %14
  %16 = add i32 %15, %8
  %17 = zext i32 %16 to i64
  %18 = extractelement <2 x i32> %13, i64 1
  %19 = mul i32 %9, %18
  %20 = add i32 %19, %10
  %21 = zext i32 %20 to i64
  %22 = mul i64 %21, %2
  %23 = add i64 %22, %17
  %24 = mul nuw nsw i32 %10, %14
  %25 = add nuw nsw i32 %24, %8
  %26 = add nuw nsw <2 x i32> %13, <i32 2, i32 2>
  %27 = extractelement <2 x i32> %26, i64 0
  %28 = extractelement <2 x i32> %26, i64 1
  %29 = mul nuw nsw i32 %28, %27
  %30 = icmp ult i64 %17, %2
  %31 = icmp ult i64 %21, %3
  %32 = select i1 %30, i1 %31, i1 false
  %33 = icmp ult i32 %25, %29
  br i1 %33, label %34, label %138

34:                                               ; preds = %4
  %35 = add i32 %15, -1
  %36 = add i32 %19, -1
  %37 = add i64 %2, -1
  %38 = trunc i64 %2 to i32
  %39 = add i32 %38, -1
  %40 = add i64 %3, -1
  %41 = trunc i64 %3 to i32
  %42 = add i32 %41, -1
  %43 = mul nuw nsw i32 %18, %14
  %44 = add nuw nsw i32 %10, %18
  %45 = mul nuw nsw i32 %44, %14
  %46 = add nuw nsw i32 %8, %45
  %47 = tail call i32 @llvm.umax.i32(i32 %29, i32 %46)
  %48 = icmp ult i32 %46, %29
  %49 = zext i1 %48 to i32
  %50 = add nuw nsw i32 %46, %49
  %51 = sub nsw i32 %47, %50
  %52 = udiv i32 %51, %43
  %53 = add i32 %52, %49
  %54 = add i32 %53, 1
  %55 = icmp ult i32 %54, 4
  br i1 %55, label %136, label %56

56:                                               ; preds = %34
  %57 = and i32 %54, -4
  %58 = mul i32 %57, %43
  %59 = add i32 %25, %58
  %60 = insertelement <4 x i32> poison, i32 %25, i64 0
  %61 = shufflevector <4 x i32> %60, <4 x i32> poison, <4 x i32> zeroinitializer
  %62 = insertelement <4 x i32> poison, i32 %43, i64 0
  %63 = shufflevector <4 x i32> %62, <4 x i32> poison, <4 x i32> zeroinitializer
  %64 = mul nuw nsw <4 x i32> %63, <i32 0, i32 1, i32 2, i32 3>
  %65 = add nuw nsw <4 x i32> %61, %64
  %66 = shl nuw nsw i32 %43, 2
  %67 = insertelement <4 x i32> poison, i32 %66, i64 0
  %68 = shufflevector <4 x i32> %67, <4 x i32> poison, <4 x i32> zeroinitializer
  %69 = shufflevector <2 x i32> %26, <2 x i32> poison, <4 x i32> zeroinitializer
  %70 = insertelement <4 x i32> poison, i32 %35, i64 0
  %71 = shufflevector <4 x i32> %70, <4 x i32> poison, <4 x i32> zeroinitializer
  %72 = insertelement <4 x i32> poison, i32 %36, i64 0
  %73 = shufflevector <4 x i32> %72, <4 x i32> poison, <4 x i32> zeroinitializer
  %74 = insertelement <4 x i64> poison, i64 %37, i64 0
  %75 = shufflevector <4 x i64> %74, <4 x i64> poison, <4 x i32> zeroinitializer
  %76 = insertelement <4 x i32> poison, i32 %39, i64 0
  %77 = shufflevector <4 x i32> %76, <4 x i32> poison, <4 x i32> zeroinitializer
  %78 = insertelement <4 x i64> poison, i64 %40, i64 0
  %79 = shufflevector <4 x i64> %78, <4 x i64> poison, <4 x i32> zeroinitializer
  %80 = insertelement <4 x i32> poison, i32 %42, i64 0
  %81 = shufflevector <4 x i32> %80, <4 x i32> poison, <4 x i32> zeroinitializer
  %82 = insertelement <4 x i64> poison, i64 %2, i64 0
  %83 = shufflevector <4 x i64> %82, <4 x i64> poison, <4 x i32> zeroinitializer
  %84 = shl nuw nsw i32 %43, 1
  %85 = mul nuw nsw i32 %43, 3
  br label %86

86:                                               ; preds = %86, %56
  %87 = phi i32 [ 0, %56 ], [ %131, %86 ]
  %88 = phi <4 x i32> [ %65, %56 ], [ %132, %86 ]
  %89 = mul i32 %87, %43
  %90 = add i32 %25, %89
  %91 = add i32 %90, %43
  %92 = add i32 %90, %84
  %93 = add i32 %90, %85
  %94 = freeze <4 x i32> %88
  %95 = freeze <4 x i32> %69
  %96 = sdiv <4 x i32> %94, %95
  %97 = mul <4 x i32> %96, %95
  %98 = sub <4 x i32> %94, %97
  %99 = add <4 x i32> %71, %98
  %100 = add <4 x i32> %73, %96
  %101 = icmp slt <4 x i32> %99, zeroinitializer
  %102 = zext <4 x i32> %99 to <4 x i64>
  %103 = icmp ult <4 x i64> %75, %102
  %104 = select <4 x i1> %103, <4 x i32> zeroinitializer, <4 x i32> %99
  %105 = select <4 x i1> %101, <4 x i32> %77, <4 x i32> %104
  %106 = icmp slt <4 x i32> %100, zeroinitializer
  %107 = zext <4 x i32> %100 to <4 x i64>
  %108 = icmp ult <4 x i64> %79, %107
  %109 = select <4 x i1> %108, <4 x i32> zeroinitializer, <4 x i32> %100
  %110 = select <4 x i1> %106, <4 x i32> %81, <4 x i32> %109
  %111 = sext <4 x i32> %110 to <4 x i64>
  %112 = mul <4 x i64> %83, %111
  %113 = sext <4 x i32> %105 to <4 x i64>
  %114 = add <4 x i64> %112, %113
  %115 = extractelement <4 x i64> %114, i64 0
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %115
  %117 = extractelement <4 x i64> %114, i64 1
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %117
  %119 = extractelement <4 x i64> %114, i64 2
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %119
  %121 = extractelement <4 x i64> %114, i64 3
  %122 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %121
  %123 = load i8, i8 addrspace(1)* %116, align 1, !tbaa !6, !amdgpu.noclobber !5
  %124 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !6, !amdgpu.noclobber !5
  %125 = load i8, i8 addrspace(1)* %120, align 1, !tbaa !6, !amdgpu.noclobber !5
  %126 = load i8, i8 addrspace(1)* %122, align 1, !tbaa !6, !amdgpu.noclobber !5
  %127 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %90
  %128 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %91
  %129 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %92
  %130 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %93
  store i8 %123, i8 addrspace(3)* %127, align 1, !tbaa !6
  store i8 %124, i8 addrspace(3)* %128, align 1, !tbaa !6
  store i8 %125, i8 addrspace(3)* %129, align 1, !tbaa !6
  store i8 %126, i8 addrspace(3)* %130, align 1, !tbaa !6
  %131 = add nuw i32 %87, 4
  %132 = add <4 x i32> %88, %68
  %133 = icmp eq i32 %131, %57
  br i1 %133, label %134, label %86, !llvm.loop !9

134:                                              ; preds = %86
  %135 = icmp eq i32 %54, %57
  br i1 %135, label %138, label %136

136:                                              ; preds = %34, %134
  %137 = phi i32 [ %25, %34 ], [ %59, %134 ]
  br label %139

138:                                              ; preds = %139, %134, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %32, label %167, label %229

139:                                              ; preds = %136, %139
  %140 = phi i32 [ %165, %139 ], [ %137, %136 ]
  %141 = freeze i32 %140
  %142 = freeze i32 %27
  %143 = sdiv i32 %141, %142
  %144 = mul i32 %143, %142
  %145 = sub i32 %141, %144
  %146 = add i32 %35, %145
  %147 = add i32 %36, %143
  %148 = icmp slt i32 %146, 0
  %149 = zext i32 %146 to i64
  %150 = icmp ult i64 %37, %149
  %151 = select i1 %150, i32 0, i32 %146
  %152 = select i1 %148, i32 %39, i32 %151
  %153 = icmp slt i32 %147, 0
  %154 = zext i32 %147 to i64
  %155 = icmp ult i64 %40, %154
  %156 = select i1 %155, i32 0, i32 %147
  %157 = select i1 %153, i32 %42, i32 %156
  %158 = sext i32 %157 to i64
  %159 = mul i64 %158, %2
  %160 = sext i32 %152 to i64
  %161 = add i64 %159, %160
  %162 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %161
  %163 = load i8, i8 addrspace(1)* %162, align 1, !tbaa !6, !amdgpu.noclobber !5
  %164 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %140
  store i8 %163, i8 addrspace(3)* %164, align 1, !tbaa !6
  %165 = add i32 %140, %43
  %166 = icmp ult i32 %165, %29
  br i1 %166, label %139, label %138, !llvm.loop !12

167:                                              ; preds = %138
  %168 = add nuw nsw i32 %10, 1
  %169 = mul nuw nsw i32 %27, %168
  %170 = add nuw nsw i32 %169, %8
  %171 = add nuw nsw i32 %170, 1
  %172 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %171
  %173 = load i8, i8 addrspace(3)* %172, align 1, !tbaa !6
  %174 = mul nuw nsw i32 %27, %10
  %175 = add nuw nsw i32 %174, %8
  %176 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %175
  %177 = load i8, i8 addrspace(3)* %176, align 1, !tbaa !6
  %178 = zext i8 %177 to i32
  %179 = add nuw nsw i32 %175, 1
  %180 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %179
  %181 = load i8, i8 addrspace(3)* %180, align 1, !tbaa !6
  %182 = zext i8 %181 to i32
  %183 = add nuw nsw i32 %182, %178
  %184 = add nuw nsw i32 %175, 2
  %185 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %184
  %186 = load i8, i8 addrspace(3)* %185, align 1, !tbaa !6
  %187 = zext i8 %186 to i32
  %188 = add nuw nsw i32 %183, %187
  %189 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %170
  %190 = load i8, i8 addrspace(3)* %189, align 1, !tbaa !6
  %191 = zext i8 %190 to i32
  %192 = add nuw nsw i32 %188, %191
  %193 = add nuw nsw i32 %170, 2
  %194 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %193
  %195 = load i8, i8 addrspace(3)* %194, align 1, !tbaa !6
  %196 = zext i8 %195 to i32
  %197 = add nuw nsw i32 %192, %196
  %198 = add nuw nsw i32 %10, 2
  %199 = mul nuw nsw i32 %27, %198
  %200 = add nuw nsw i32 %199, %8
  %201 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %200
  %202 = load i8, i8 addrspace(3)* %201, align 1, !tbaa !6
  %203 = zext i8 %202 to i32
  %204 = add nuw nsw i32 %197, %203
  %205 = add nuw nsw i32 %200, 1
  %206 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %205
  %207 = load i8, i8 addrspace(3)* %206, align 1, !tbaa !6
  %208 = zext i8 %207 to i32
  %209 = add nuw nsw i32 %204, %208
  %210 = add nuw nsw i32 %200, 2
  %211 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @board_sh, i32 0, i32 %210
  %212 = load i8, i8 addrspace(3)* %211, align 1, !tbaa !6
  %213 = zext i8 %212 to i32
  %214 = add nuw nsw i32 %209, %213
  %215 = icmp eq i8 %173, 1
  br i1 %215, label %216, label %225

216:                                              ; preds = %167
  %217 = icmp ult i32 %214, 2
  br i1 %217, label %218, label %220

218:                                              ; preds = %216
  %219 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %23
  store i8 0, i8 addrspace(1)* %219, align 1, !tbaa !6
  br label %229

220:                                              ; preds = %216
  %221 = icmp ult i32 %214, 4
  %222 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %23
  br i1 %221, label %223, label %224

223:                                              ; preds = %220
  store i8 1, i8 addrspace(1)* %222, align 1, !tbaa !6
  br label %229

224:                                              ; preds = %220
  store i8 0, i8 addrspace(1)* %222, align 1, !tbaa !6
  br label %229

225:                                              ; preds = %167
  %226 = icmp eq i32 %214, 3
  br i1 %226, label %227, label %229

227:                                              ; preds = %225
  %228 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %23
  store i8 1, i8 addrspace(1)* %228, align 1, !tbaa !6
  br label %229

229:                                              ; preds = %223, %224, %218, %227, %225, %138
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #3

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
!5 = !{}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = distinct !{!12, !10, !13, !11}
!13 = !{!"llvm.loop.unroll.runtime.disable"}
