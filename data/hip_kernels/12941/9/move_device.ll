; ModuleID = '../data/hip_kernels/12941/9/main.cu'
source_filename = "../data/hip_kernels/12941/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sharedMemT = external hidden local_unnamed_addr addrspace(3) global [0 x i8], align 1

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4movePhjjtb(i8 addrspace(1)* nocapture %0, i32 %1, i32 %2, i16 %3, i1 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = zext i32 %2 to i64
  %8 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %7
  %9 = icmp eq i16 %3, 0
  br i1 %9, label %106, label %10

10:                                               ; preds = %5
  %11 = zext i16 %3 to i32
  %12 = mul nuw nsw i32 %6, %11
  %13 = icmp ult i16 %3, 4
  br i1 %13, label %104, label %14

14:                                               ; preds = %10
  %15 = and i32 %11, 65532
  %16 = insertelement <4 x i32> poison, i32 %12, i64 0
  %17 = shufflevector <4 x i32> %16, <4 x i32> poison, <4 x i32> zeroinitializer
  %18 = add nsw i32 %11, -4
  %19 = lshr i32 %18, 2
  %20 = add nuw nsw i32 %19, 1
  %21 = and i32 %20, 1
  %22 = icmp ult i32 %18, 4
  br i1 %22, label %80, label %23

23:                                               ; preds = %14
  %24 = and i32 %20, -2
  br label %25

25:                                               ; preds = %75, %23
  %26 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %23 ], [ %77, %75 ]
  %27 = phi i32 [ 0, %23 ], [ %78, %75 ]
  %28 = add nuw nsw <4 x i32> %17, %26
  %29 = zext <4 x i32> %28 to <4 x i64>
  %30 = extractelement <4 x i64> %29, i64 0
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %30
  %32 = bitcast i8 addrspace(1)* %31 to <4 x i8> addrspace(1)*
  %33 = load <4 x i8>, <4 x i8> addrspace(1)* %32, align 1, !tbaa !5
  %34 = extractelement <4 x i32> %28, i64 0
  %35 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %34
  %36 = bitcast i8 addrspace(3)* %35 to <4 x i8> addrspace(3)*
  store <4 x i8> %33, <4 x i8> addrspace(3)* %36, align 1, !tbaa !5
  br i1 %4, label %37, label %64

37:                                               ; preds = %25
  %38 = extractelement <4 x i64> %29, i64 0
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %38
  store i8 0, i8 addrspace(1)* %39, align 1, !tbaa !5
  %40 = extractelement <4 x i64> %29, i64 1
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %40
  store i8 0, i8 addrspace(1)* %41, align 1, !tbaa !5
  %42 = extractelement <4 x i64> %29, i64 2
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %42
  store i8 0, i8 addrspace(1)* %43, align 1, !tbaa !5
  %44 = extractelement <4 x i64> %29, i64 3
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %44
  store i8 0, i8 addrspace(1)* %45, align 1, !tbaa !5
  %46 = add <4 x i32> %26, <i32 4, i32 4, i32 4, i32 4>
  %47 = add nuw nsw <4 x i32> %17, %46
  %48 = zext <4 x i32> %47 to <4 x i64>
  %49 = extractelement <4 x i64> %48, i64 0
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %49
  %51 = bitcast i8 addrspace(1)* %50 to <4 x i8> addrspace(1)*
  %52 = load <4 x i8>, <4 x i8> addrspace(1)* %51, align 1, !tbaa !5
  %53 = extractelement <4 x i32> %47, i64 0
  %54 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %53
  %55 = bitcast i8 addrspace(3)* %54 to <4 x i8> addrspace(3)*
  store <4 x i8> %52, <4 x i8> addrspace(3)* %55, align 1, !tbaa !5
  %56 = extractelement <4 x i64> %48, i64 0
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %56
  store i8 0, i8 addrspace(1)* %57, align 1, !tbaa !5
  %58 = extractelement <4 x i64> %48, i64 1
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %58
  store i8 0, i8 addrspace(1)* %59, align 1, !tbaa !5
  %60 = extractelement <4 x i64> %48, i64 2
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %60
  store i8 0, i8 addrspace(1)* %61, align 1, !tbaa !5
  %62 = extractelement <4 x i64> %48, i64 3
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %62
  store i8 0, i8 addrspace(1)* %63, align 1, !tbaa !5
  br label %75

64:                                               ; preds = %25
  %65 = add <4 x i32> %26, <i32 4, i32 4, i32 4, i32 4>
  %66 = add nuw nsw <4 x i32> %17, %65
  %67 = extractelement <4 x i32> %66, i64 0
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %68
  %70 = bitcast i8 addrspace(1)* %69 to <4 x i8> addrspace(1)*
  %71 = load <4 x i8>, <4 x i8> addrspace(1)* %70, align 1, !tbaa !5
  %72 = extractelement <4 x i32> %66, i64 0
  %73 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %72
  %74 = bitcast i8 addrspace(3)* %73 to <4 x i8> addrspace(3)*
  store <4 x i8> %71, <4 x i8> addrspace(3)* %74, align 1, !tbaa !5
  br label %75

75:                                               ; preds = %64, %37
  %76 = phi <4 x i32> [ %65, %64 ], [ %46, %37 ]
  %77 = add <4 x i32> %76, <i32 4, i32 4, i32 4, i32 4>
  %78 = add i32 %27, 2
  %79 = icmp eq i32 %78, %24
  br i1 %79, label %80, label %25, !llvm.loop !8

80:                                               ; preds = %75, %14
  %81 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %14 ], [ %77, %75 ]
  %82 = icmp eq i32 %21, 0
  br i1 %82, label %102, label %83

83:                                               ; preds = %80
  %84 = add nuw nsw <4 x i32> %17, %81
  %85 = zext <4 x i32> %84 to <4 x i64>
  %86 = extractelement <4 x i64> %85, i64 0
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %86
  %88 = bitcast i8 addrspace(1)* %87 to <4 x i8> addrspace(1)*
  %89 = load <4 x i8>, <4 x i8> addrspace(1)* %88, align 1, !tbaa !5
  %90 = extractelement <4 x i32> %84, i64 0
  %91 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %90
  %92 = bitcast i8 addrspace(3)* %91 to <4 x i8> addrspace(3)*
  store <4 x i8> %89, <4 x i8> addrspace(3)* %92, align 1, !tbaa !5
  br i1 %4, label %93, label %102

93:                                               ; preds = %83
  %94 = extractelement <4 x i64> %85, i64 0
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %94
  store i8 0, i8 addrspace(1)* %95, align 1, !tbaa !5
  %96 = extractelement <4 x i64> %85, i64 1
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %96
  store i8 0, i8 addrspace(1)* %97, align 1, !tbaa !5
  %98 = extractelement <4 x i64> %85, i64 2
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %98
  store i8 0, i8 addrspace(1)* %99, align 1, !tbaa !5
  %100 = extractelement <4 x i64> %85, i64 3
  %101 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %100
  store i8 0, i8 addrspace(1)* %101, align 1, !tbaa !5
  br label %102

102:                                              ; preds = %83, %93, %80
  %103 = icmp eq i32 %15, %11
  br i1 %103, label %106, label %104

104:                                              ; preds = %10, %102
  %105 = phi i32 [ 0, %10 ], [ %15, %102 ]
  br label %116

106:                                              ; preds = %124, %102, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %107 = zext i32 %1 to i64
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %107
  br i1 %9, label %141, label %109

109:                                              ; preds = %106
  %110 = zext i16 %3 to i32
  %111 = mul nuw nsw i32 %6, %110
  %112 = and i32 %110, 7
  %113 = icmp ult i16 %3, 8
  br i1 %113, label %127, label %114

114:                                              ; preds = %109
  %115 = and i32 %110, 65528
  br label %142

116:                                              ; preds = %104, %124
  %117 = phi i32 [ %125, %124 ], [ %105, %104 ]
  %118 = add nuw nsw i32 %12, %117
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 %119
  %121 = load i8, i8 addrspace(1)* %120, align 1, !tbaa !5
  %122 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %118
  store i8 %121, i8 addrspace(3)* %122, align 1, !tbaa !5
  br i1 %4, label %123, label %124

123:                                              ; preds = %116
  store i8 0, i8 addrspace(1)* %120, align 1, !tbaa !5
  br label %124

124:                                              ; preds = %116, %123
  %125 = add nuw nsw i32 %117, 1
  %126 = icmp eq i32 %125, %11
  br i1 %126, label %106, label %116, !llvm.loop !11

127:                                              ; preds = %142, %109
  %128 = phi i32 [ 0, %109 ], [ %192, %142 ]
  %129 = icmp eq i32 %112, 0
  br i1 %129, label %141, label %130

130:                                              ; preds = %127, %130
  %131 = phi i32 [ %138, %130 ], [ %128, %127 ]
  %132 = phi i32 [ %139, %130 ], [ 0, %127 ]
  %133 = add nuw nsw i32 %111, %131
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %133
  %136 = load i8, i8 addrspace(3)* %135, align 1, !tbaa !5
  %137 = getelementptr inbounds i8, i8 addrspace(1)* %108, i64 %134
  store i8 %136, i8 addrspace(1)* %137, align 1, !tbaa !5
  %138 = add nuw nsw i32 %131, 1
  %139 = add i32 %132, 1
  %140 = icmp eq i32 %139, %112
  br i1 %140, label %141, label %130, !llvm.loop !13

141:                                              ; preds = %127, %130, %106
  ret void

142:                                              ; preds = %142, %114
  %143 = phi i32 [ 0, %114 ], [ %192, %142 ]
  %144 = phi i32 [ 0, %114 ], [ %193, %142 ]
  %145 = add nuw nsw i32 %111, %143
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %145
  %148 = load i8, i8 addrspace(3)* %147, align 1, !tbaa !5
  %149 = getelementptr inbounds i8, i8 addrspace(1)* %108, i64 %146
  store i8 %148, i8 addrspace(1)* %149, align 1, !tbaa !5
  %150 = or i32 %143, 1
  %151 = add nuw nsw i32 %111, %150
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %151
  %154 = load i8, i8 addrspace(3)* %153, align 1, !tbaa !5
  %155 = getelementptr inbounds i8, i8 addrspace(1)* %108, i64 %152
  store i8 %154, i8 addrspace(1)* %155, align 1, !tbaa !5
  %156 = or i32 %143, 2
  %157 = add nuw nsw i32 %111, %156
  %158 = zext i32 %157 to i64
  %159 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %157
  %160 = load i8, i8 addrspace(3)* %159, align 1, !tbaa !5
  %161 = getelementptr inbounds i8, i8 addrspace(1)* %108, i64 %158
  store i8 %160, i8 addrspace(1)* %161, align 1, !tbaa !5
  %162 = or i32 %143, 3
  %163 = add nuw nsw i32 %111, %162
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %163
  %166 = load i8, i8 addrspace(3)* %165, align 1, !tbaa !5
  %167 = getelementptr inbounds i8, i8 addrspace(1)* %108, i64 %164
  store i8 %166, i8 addrspace(1)* %167, align 1, !tbaa !5
  %168 = or i32 %143, 4
  %169 = add nuw nsw i32 %111, %168
  %170 = zext i32 %169 to i64
  %171 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %169
  %172 = load i8, i8 addrspace(3)* %171, align 1, !tbaa !5
  %173 = getelementptr inbounds i8, i8 addrspace(1)* %108, i64 %170
  store i8 %172, i8 addrspace(1)* %173, align 1, !tbaa !5
  %174 = or i32 %143, 5
  %175 = add nuw nsw i32 %111, %174
  %176 = zext i32 %175 to i64
  %177 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %175
  %178 = load i8, i8 addrspace(3)* %177, align 1, !tbaa !5
  %179 = getelementptr inbounds i8, i8 addrspace(1)* %108, i64 %176
  store i8 %178, i8 addrspace(1)* %179, align 1, !tbaa !5
  %180 = or i32 %143, 6
  %181 = add nuw nsw i32 %111, %180
  %182 = zext i32 %181 to i64
  %183 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %181
  %184 = load i8, i8 addrspace(3)* %183, align 1, !tbaa !5
  %185 = getelementptr inbounds i8, i8 addrspace(1)* %108, i64 %182
  store i8 %184, i8 addrspace(1)* %185, align 1, !tbaa !5
  %186 = or i32 %143, 7
  %187 = add nuw nsw i32 %111, %186
  %188 = zext i32 %187 to i64
  %189 = getelementptr inbounds [0 x i8], [0 x i8] addrspace(3)* @sharedMemT, i32 0, i32 %187
  %190 = load i8, i8 addrspace(3)* %189, align 1, !tbaa !5
  %191 = getelementptr inbounds i8, i8 addrspace(1)* %108, i64 %188
  store i8 %190, i8 addrspace(1)* %191, align 1, !tbaa !5
  %192 = add nuw nsw i32 %143, 8
  %193 = add i32 %144, 8
  %194 = icmp eq i32 %193, %115
  br i1 %194, label %127, label %142, !llvm.loop !15
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = distinct !{!11, !9, !12, !10}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !9}
